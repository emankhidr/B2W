import 'package:flutter/material.dart';

import '../../../features/home/presentation/pages/home_page.dart';


class AddEmployeesStep extends StatefulWidget {
  const AddEmployeesStep({super.key});

  @override
  State<AddEmployeesStep> createState() => _AddEmployeesStepState();
}

class _AddEmployeesStepState extends State<AddEmployeesStep> {
  final TextEditingController _searchController = TextEditingController();
  bool isSearching = false;
  final List<Map<String, String>> allEmployees = [
    {"name": "Murad Mohamed", "role": "Product manager", "image": "https://i.pravatar.cc/150?img=1"},
    {"name": "Murad wael", "role": "Graphic Designer", "image": "https://i.pravatar.cc/150?img=2"},
    {"name": "Murad Ahmed", "role": "UI Designer", "image": "https://i.pravatar.cc/150?img=3"},
  ];

  final Set<String> selectedNames = {"Murad Mohamed"};

  @override
  Widget build(BuildContext context) {
    final filteredEmployees = allEmployees.where((emp) => emp["name"]!.toLowerCase().contains(_searchController.text.toLowerCase())).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: 3 / 3,
                            strokeWidth: 5,
                            backgroundColor: Colors.grey.shade300,
                            valueColor: const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                          ),
                          const Text("3/3", style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Step 3", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          SizedBox(width: 4),
                          Text("Add Employees", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  const Text("Skip", style: TextStyle(decoration: TextDecoration.underline, color: Colors.deepPurple, fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(height: 24),
              const Text("Could you please add employees\nvia their accounts?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 42,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xFF7F00FF).withOpacity(0.8), width: 1),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      isSearching = value.isNotEmpty;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.purple),
                    suffixIcon: isSearching
                        ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        _searchController.clear();
                        setState(() {
                          isSearching = false;
                        });
                      },
                    )
                        : const Icon(Icons.mic, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 6),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredEmployees.length,
                  itemBuilder: (context, index) {
                    final employee = filteredEmployees[index];
                    final isSelected = selectedNames.contains(employee["name"]);
                    return ListTile(
                      leading: CircleAvatar(backgroundImage: NetworkImage(employee["image"]!)),
                      title: Text(employee["name"]!, style: const TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: Text(employee["role"]!, style: const TextStyle(color: Colors.grey)),
                      trailing: IconButton(
                        icon: Icon(isSelected ? Icons.close : Icons.add, color: Colors.deepPurple),
                        onPressed: () {
                          setState(() {
                            if (isSelected) {
                              selectedNames.remove(employee["name"]);
                            } else {
                              selectedNames.add(employee["name"]!);
                            }
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Final submission or navigation
Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),)) ;                 },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color(0xFF7F00FF),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("Save and start", style: TextStyle(fontSize: 16,color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
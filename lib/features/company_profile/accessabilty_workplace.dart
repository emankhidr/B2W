import 'package:flutter/material.dart';

import 'add_employee.dart';

class AccessibilityStep extends StatefulWidget {
  const AccessibilityStep({super.key});

  @override
  State<AccessibilityStep> createState() => _AccessibilityStepState();
}

class _AccessibilityStepState extends State<AccessibilityStep> {
  final List<String> features = [
    "Wheelchair-accessible Workplace",
    "Parking for People with Disabilities",
    "Flexible Work Hours",
    "Wheelchair Ramp Access",
    "Elevator Access",
    "Remote Work Option"
  ];

  final List<String> selectedFeatures = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                            value: 2 / 3,
                            strokeWidth: 5,
                            backgroundColor: Colors.grey.shade300,
                            valueColor: const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                          ),
                          const Text("2/3", style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Step 2", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          SizedBox(width: 4),
                          Text("Accessibility in the Workplace", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  const Text("Skip", style: TextStyle(decoration: TextDecoration.underline, color: Colors.deepPurple, fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(height: 24),
              const Text("What accessibility features does your company provide?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.3,
                  children: features.map((feature) {
                    final isSelected = selectedFeatures.contains(feature);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected ? selectedFeatures.remove(feature) : selectedFeatures.add(feature);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: isSelected ? Colors.deepPurple : Colors.grey.shade300, width: 2),
                          borderRadius: BorderRadius.circular(16),
                          color: isSelected ? Colors.deepPurple.shade50 : Colors.white,
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Center(
                          child: Text(
                            feature,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: isSelected ? Colors.deepPurple : Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddEmployeesStep()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color(0xFF7F00FF),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("Next", style: TextStyle(fontSize: 16,color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
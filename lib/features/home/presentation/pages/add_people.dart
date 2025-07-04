
import 'package:b2w/core/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/custom_appbar_widget.dart';

class AddPeopleScreen extends StatefulWidget {
  @override
  _AddPeopleScreenState createState() => _AddPeopleScreenState();
}

class _AddPeopleScreenState extends State<AddPeopleScreen> {

  List<Map<String, String>> allPeople = [
    {"name": "Murad Mohamed", "title": "Product Manager", "image": "assets/image/Ellipse 189(2).png"},
    {"name": "Murad Wael", "title": "Graphic Designer", "image": "assets/image/Ellipse 189(1).png"},
    {"name": "Murad Ahmed", "title": "UI Designer", "image": "assets/image/Ellipse 189(3).png"},
  ];

  List<Map<String, String>> filteredPeople = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredPeople = allPeople;
  }

  void filterSearch(String query) {
    setState(() {
      filteredPeople = allPeople
          .where((person) => person["name"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarContent(title: "Add People", context: context),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
             Container(
              width: double.infinity,
              height: 42,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.primary, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary,
                    blurRadius: 8,
                    spreadRadius: 0,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: filterSearch,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search...",
                      ),
                    ),
                  ),
                  if (searchController.text.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        searchController.clear();
                        filterSearch(""); // إعادة ضبط البحث
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.close, size: 18, color: AppColors.black),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // قائمة الأشخاص
            Expanded(
              child: ListView.builder(
                itemCount: filteredPeople.length,
                itemBuilder: (context, index) {
                  final person = filteredPeople[index];

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(person["image"]!),
                    ),
                    title: Text(person["name"]!, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(person["title"]!),
                    trailing: IconButton(
                      icon: Icon(
                        index == 0 ? Icons.close : Icons.add, // أول شخص يحتوي على X والبقية تحتوي على +
                        color: AppColors.primary,
                      ),
                      onPressed: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

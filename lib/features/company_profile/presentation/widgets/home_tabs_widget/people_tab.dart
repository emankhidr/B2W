
import 'package:flutter/material.dart';

import '../../../../../core/utils/sizes.dart';

Widget peopleTab({required VoidCallback onPressed}) {
  List<Map<String, String>> people = [
    {"name": "Liam Carter", "title": "CEO", "image": "assets/images/Ellipse 189(2).png"},
    {
      "name": "Murad Mohamed",
      "title": "Product Manager",
      "image": "assets/images/Ellipse 189(2).png"
    },
    {
      "name": "Salma Ahmed",
      "title": "Product Designer",
      "image": "assets/images/Ellipse 189(3).png"
    },
    {
      "name": "Ali Wael",
      "title": "Graphic Designer",
      "image": "assets/images/Ellipse 189(4).png"
    },
    {"name": "Waleed Ali", "title": "HR", "image": "assets/images/waleed.jpg"},
    {
      "name": "Sophia Bennett",
      "title": "Motion Designer",
      "image": "assets/images/Ellipse 189(1).png"
    },
    {
      "name": "Mia Collins",
      "title": "Product Manager",
      "image": "assets/images/Ellipse 189.png"
    },
    {
      "name": "Ethan Rivera",
      "title": "Product Manager",
      "image": "assets/images/Ellipse 189(2).png"
    },
  ];

  return Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "People (${people.length})",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton.icon(
              onPressed:onPressed,
              icon: Icon(Icons.add, color: Colors.white),
              label: Text("Add People", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff7F00FF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.separated(
            itemCount: people.length,
            itemBuilder: (context, index) {
              return  Row(children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(people[index]["image"]!),
                ),
                spaceWidth(5),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(people[index]["name"]!,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  spaceHeight(5),
                  Text(people[index]["title"]!),
                ],),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.grey),
                  onPressed: () {},
                ),
              ],);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 70), // يضيف مسافة 10 من اليمين واليسار
                child: Divider(color: Colors.grey,thickness: 0.3,),
              );
            },
          ),
        ),
      ],
    ),
  );
}

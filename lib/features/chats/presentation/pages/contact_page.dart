
import 'package:flutter/material.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';

class ContactsPage extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {"name": "Ahmed Ali", "image": "assets/image/chat img.png"},
    {"name": "Mona Samir", "image": "assets/image/chat.png"},
    {"name": "Khaled Hassan", "image": "assets/image/person img.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Select Contact',
            style: StyleManger.black20bold()),
        backgroundColor: ColorManger.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color:ColorManger.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: contacts.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading:
                CircleAvatar(backgroundImage: AssetImage(contact["image"]!)),
            title: Text(contact["name"]!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pop(context, contact);
            },
          );
        },
      ),
    );
  }
}

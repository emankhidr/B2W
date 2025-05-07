import 'package:flutter/material.dart';

class FollowersScreen extends StatelessWidget {
  final List<Map<String, String>> followers = [
    {
      'name': 'Murad Mohamed',
      'role': 'Product manager',
      'image': 'assets/images/Ellipse 189(2).png'
    },
    {
      'name': 'Mai Maged',
      'role': 'Product Designer',
      'image': 'assets/images/Ellipse 189(3).png'
    },
    {
      'name': 'Ali Wael',
      'role': 'Graphic Designer',
      'image': 'assets/images/Ellipse 189(4).png'
    },
    {
      'name': 'Waleed Ali',
      'role': 'HR',
      'image': 'assets/images/Ellipse 189(4).png'
    },
    {
      'name': 'Liam Carter',
      'role': 'CEO',
      'image': 'assets/images/Ellipse 189(2).png'
    },
    {
      'name': 'Sophia Bennett',
      'role': 'Motion designer',
      'image': 'assets/images/Ellipse 189(1).png'
    },
    {
      'name': 'Mia Collins',
      'role': 'Product manager',
      'image': 'assets/images/Ellipse 189(3).png'
    },
    {
      'name': 'Ethan Rivera',
      'role': 'Product manager',
      'image': 'assets/images/Ellipse 189(4).png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Followers', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '100K followers',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: followers.length,
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Divider(
                    thickness: 0.2,
                    color: Colors.grey,
                  ),
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(followers[index]['image']!),
                    ),
                    title: Text(
                      followers[index]['name']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(followers[index]['role']!),
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

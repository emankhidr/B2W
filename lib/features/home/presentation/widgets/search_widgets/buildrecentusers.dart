import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildRecentUsers({required List recentUsers}) {
  return ListView(
    padding: EdgeInsets.all(16),
    children: [
      Text("Recents",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ...recentUsers.map((user) => ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(user["image"]!),
        ),
        title: Text(user['name']!),
        subtitle: Text(user['role']!),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.close),
        ),
      )),
    ],
  );
}
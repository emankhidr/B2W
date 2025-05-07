import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/chat_page.dart';

Widget chatItem(BuildContext context,
    {required String name,
      required String message,
      required String time,
      required String image}) {
  return ListTile(
    leading: CircleAvatar(backgroundImage: AssetImage(image)),
    title: Text(name,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    subtitle: Text(message, overflow: TextOverflow.ellipsis),
    trailing: Text(time, style: TextStyle(color: Colors.grey)),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatPage(name: name, image: image),
        ),
      );
    },
  );
}
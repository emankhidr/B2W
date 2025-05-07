import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildFollowTile(Map<String, String> data) {
  return  Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(data['image']!),
      ),
      SizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data['name']!),
          Text(data['role']!),
        ],
      ),
      Spacer(),
      GestureDetector(onTap: () {

      },
        child: Container(
          child: Center(child: Text("Follow",style: TextStyle(color: Colors.white),)),
          height: 34,
          decoration: BoxDecoration(
              color: Colors.purple, borderRadius: BorderRadius.circular(10)),
          width: 69,
        ),
      )
    ],
  );




}

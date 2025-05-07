
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/sizes.dart';

Widget buildTab({
  required String text,
  required String tabTitle,
  required fieldsType enumData,
}) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tabTitle,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 100),
        if (enumData == fieldsType.company)
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("contact"),
              spaceHeight(10),
              Row(
                children: [
                  CircleAvatar(radius: 30,
                    backgroundImage: AssetImage('assets/images/Ellipse 189(1).png'),
                   ),
                  spaceWidth(10),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                    Text("Mohamed"),
                    Text("HR")
                  ],),
                  spaceWidth(40),
                  IconButton(onPressed: (){}, icon: Icon( Icons.phone))
                ],
              ),
            ],
          ),
      ],
    ),
  );
}

enum fieldsType {
  reqyuirment,
  company,
  description,
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildSearchTab({
  required String name,
  required String job,
  required String image,
}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(image),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(job, style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                // أضف هنا وظيفة المتابعة
              },
              child: Container(
                height: 34,
                width: 69,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child:
                        Text("Follow", style: TextStyle(color: Colors.white))),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

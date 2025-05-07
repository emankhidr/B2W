import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildProjectCard({
  required String imagePath,
  required String title,
  required String description,
}){
  return Container(
    margin: EdgeInsets.all(10), // إضافة مسافة لمنع تداخل الظل
    width: 220,
    height: 274,
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.20), // اللون بقيمة 25%
          blurRadius: 10, // مقدار التمويه
          spreadRadius: 0.5, // مدى الانتشار
          offset: Offset(0, 3), // الإزاحة (X: 0, Y: 6)
        ),
      ],
    ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            height: 117,
            fit: BoxFit.cover,
            width: 196,
          ),
        ),
        const SizedBox(height: 10),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text(
          description,
          style:
          TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}
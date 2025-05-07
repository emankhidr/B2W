import 'package:flutter/material.dart';

Widget buildTimeLine({
  required IconData icon,
  required String title,
  required String subtitle,
  required bool isLast, // <-- متغير جديد لتحديد العنصر الأخير
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.purple.shade100,
            child: Icon(icon, color: Colors.purple),
          ),
          if (!isLast) // <-- إخفاء الخط إذا كان العنصر الأخير
            Container(
              width: 2,
              height: 50,
              color: Colors.purple.shade100,
            ),
        ],
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(subtitle, style: TextStyle(color: Colors.black54)),
            ],
          ),
        ),
      ),
    ],
  );
}

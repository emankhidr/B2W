import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

Widget buildInfo(IconData icon, String title, String value) {
  return Column(
    children: [
      CircleAvatar(
        radius: 24,
        backgroundColor: Colors.purple.shade100,
        child: Icon(icon, color: AppColors.primary, size: 24),
      ),
      SizedBox(height: 4),
      Text(title, style: TextStyle(fontSize: 12, color: Colors.grey)),
      Text(value,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
    ],
  );
}

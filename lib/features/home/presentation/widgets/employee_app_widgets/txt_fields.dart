import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

Widget buildDetailField(
    {required String hintText, required TextEditingController controller}) {
  return Container(
    height: 42,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
      color: Color(0xFFE3E3E5), // اللون من الصورة
      borderRadius: BorderRadius.circular(12), // Radius 12px
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
      ),
    ),
  );
}

Widget buildCVField({required String cvName,required VoidCallback pickCVFile }) {
  return GestureDetector(
    onTap: pickCVFile, // عند الضغط، يتم فتح الملفات
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFFE3E3E5), // اللون من الصورة
          borderRadius: BorderRadius.circular(12), // Radius 12px
        ),
        child: Row(
          children: [
            Text("CV : ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              cvName ?? "اختر ملف",
              style: TextStyle(
                color: AppColors.primary,
                decoration: TextDecoration.underline,
              ),
            ),

            Icon(Icons.download, color: AppColors.primary),
          ],
        ),
      ),
    ),
  );
}

Widget buildCommentField() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Comments :", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(
            "Est similique dolor ipsum vel illum commodo eos placet magnam.",
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    ),
  );
}
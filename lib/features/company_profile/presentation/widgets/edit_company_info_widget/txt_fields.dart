import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildTextField(
    String label, TextEditingController controller, IconData icon,
    {int maxLines = 1}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 10),
      Text(label,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.grey[700])),
      const SizedBox(height: 5),
      TextField(
        decoration: InputDecoration(
          suffixIcon:
          IconButton(onPressed: () {}, icon: Icon(icon)),
          filled: true,
          fillColor: Color(0xFFE3E3E5),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          hintText: "Digital Creative Agency",
        ),
      )
    ],
  );
}
Widget buildTextFieldWithDropdown({
  required String label,
  required TextEditingController controller,
  required List<String> options,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 10),
      Text(label,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.grey[700])),
      const SizedBox(height: 5),
      TextField(
        controller: controller, // ✅ إضافة الكنترولر هنا
        readOnly: true, // ✅ منع الكتابة اليدوية
        decoration: InputDecoration(
          suffixIcon: PopupMenuButton<String>(
            icon: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey),
            onSelected: (String value) {
              controller.text = value; // ✅ تحديث النص داخل الفيلد
            },
            itemBuilder: (BuildContext context) {
              return options.map((String option) {
                return PopupMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList();
            },
          ),
          filled: true,
          fillColor: Color(0xFFE3E3E5),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          hintText: "Digital Creative Agency",
        ),
      ),
    ],
  );
}


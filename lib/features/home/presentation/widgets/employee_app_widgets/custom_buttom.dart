import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customElevatedButtom(
    {required VoidCallback onTap,
    required String title,
    required Color buttonColor}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 171,
      height: 48,
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(15)),
      child: Center(child: Text(title, style: TextStyle(color: Colors.white))),
    ),
  );
}

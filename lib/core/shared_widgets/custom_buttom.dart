import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customButtom({required String title, required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0xff7F00FF)),
    ),
  );
}

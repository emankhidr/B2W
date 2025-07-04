import 'package:b2w/core/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared_widgets/custom_buttom.dart';

Widget containerHome({required String companyName,required String time,required String numberOfApp,required String title,}){
  return Container(
    width: 358,
    constraints: BoxConstraints(
        minHeight:
        237),
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius:
      BorderRadius.circular(20),
      border: Border.all(
          color: Color(0xffE3E3E5), width: 1),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              backgroundImage: AssetImage(
                  "assets/images/Ellipse 13.png"),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  companyName,
                  style:
                  TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  time,
                  style: TextStyle(
                      color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Text(
                numberOfApp,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 25),
        Center(
          child: Container(
            width: 191,
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                 AppColors.white,
                  AppColors.primary
                ], // عكس التدرج
              ),
            ),
          ),
        ),

        SizedBox(height: 40),
        customButtom(
            title: 'Show Job Applications', onTap: () {})
      ],
    ),
  );
}
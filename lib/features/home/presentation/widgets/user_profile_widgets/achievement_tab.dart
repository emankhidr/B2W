import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import 'build_project_card.dart';
import 'build_time_line.dart';

Widget achievementWidget(){
  return SingleChildScrollView(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Millstones TimeLine",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Show all",
                  style: TextStyle(color: AppColors.primary, fontSize: 14),
                )),
          ],
        ),
        const SizedBox(height: 10),

        /// التايم لاين
        Column(
          children: [
            buildTimeLine(
              icon: Icons.bar_chart,
              title: "Improved User Retention",
              subtitle: "Bright Media Solutions\nApril 2023", isLast: false,
            ),
            buildTimeLine(isLast: false,
              icon: Icons.mobile_friendly,
              title: "Successful Banking App Launch",
              subtitle: "Digital Creative Agency\nDecember 2022",
            ),
            buildTimeLine(isLast: true,
              icon: Icons.workspace_premium,
              title: "Best UI Design Award",
              subtitle: "Digital Creative Agency\nSeptember 2022",
            ),
          ],
        ),

        const SizedBox(height: 20),

         Text(
          "Projects",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        /// عرض البطاقات
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              buildProjectCard(
                imagePath: "assets/image/Frame 192.png",
                title: "Healthcare App Redesign",
                description:
                "Vel molestias consequuntur rerum laborum soluta corrupti.",
              ),
              const SizedBox(width: 5),
              buildProjectCard(
                imagePath: "assets/image/Frame 192(1).png",
                title: "Healthcare App Redesign",
                description:
                "Vel molestias consequuntur rerum laborum soluta corrupti.",
              ),
            ],
          ),
        ),
      ],
    ),
  );

}
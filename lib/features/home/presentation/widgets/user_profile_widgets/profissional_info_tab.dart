import 'package:b2w/core/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/sizes.dart';



Widget profissionalInfoWidget() {
  return SingleChildScrollView(
    padding: EdgeInsets.all(16.0),
    child: Column(
      children: [
        buildSection(
          icon: Icons.info,
          title: "About me",
          child: Text(
            "Enim qui nisi non voluptas. Autem eligendi vel aut dolore iure. Ut vel placeat sit.\nssssssssssssssssssssssssssss",
            style: TextStyle(color: Colors.black54),
          ), pageName: '',
        ),
        spaceHeight(15),
        buildSection(
          icon: Icons.cast_for_education,
          title: "Education",
          child: ListTile(
            leading: Image.asset("assets/image/images 1.png"),
            title: Text("Bachelor of Computer Science"),
            subtitle: Text("Mansoura University"),
          ), pageName: '',
        ),
        spaceHeight(15),
        buildSection(
          icon: Icons.work,
          title: "Experience",
          child: Column(
            children: [
              buildExperienceTile(
                title: "Bright Media Solutions",
                subtitle: "UI/UX Designer\nFebruary 2023 - Present",
                index: 2,
                imagePath: 'assets/image/c.png',
                isLast: false,
              ),
              buildExperienceTile(
                title: "Digital Creative Agency",
                subtitle: "UI Designer\nJuly 2022 - January 2023",
                index: 1,
                imagePath: 'assets/image/c.png',
                isLast: true,
              ),
            ],
          ), pageName: '',
        ),
        spaceHeight(5),
        buildSection(
            icon: Icons.star,
            title: "Skills",
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.circle, size: 10, color: Colors.grey),
                    spaceWidth(3),
                    Text("figma"),
                  ],
                ),
                spaceHeight(5),
                Row(
                  children: [
                    Icon(Icons.circle, size: 10, color: Colors.grey),
                    spaceWidth(3),
                    Text("figma"),
                  ],
                ),
                spaceHeight(5),
                Row(
                  children: [
                    Icon(Icons.circle, size: 10, color: Colors.grey),
                    spaceWidth(3),
                    Text("figma"),
                  ],
                ),
                spaceHeight(5),
                Row(
                  children: [
                    Icon(Icons.circle, size: 10, color: Colors.grey),
                    spaceWidth(3),
                    Text("figma"),
                  ],
                ),
                spaceHeight(5),
              ],
            ), pageName: ''),
        spaceHeight(5),
        buildSection(
          icon: Icons.card_membership,
          title: "Certificates & License",
          child: Column(
            children: [
              buildCertificateTile("Google UX Design Certificate", "Coursera",
                  "assets/image/udemy.png"),
              buildCertificateTile(
                  "Advanced Figma Masterclass", "Udemy", "assets/image/c.png"),
            ],
          ), pageName: '',
        ),
        spaceHeight(5),
        buildSection(
          icon: Icons.file_present,
          title: "Resume/CV",
          child: ListTile(
            leading: Icon(Icons.picture_as_pdf, color: Colors.red),
            title: Text("My cv.pdf", style: TextStyle(color: AppColors.primary)),

          ), pageName: '',
        ),
      ],
    ),
  );
}

Widget buildSection({
  required IconData icon,
  required String title,
  required Widget child,
  required String pageName, // إضافة اسم الصفحة كـ parameter
}) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Color(0xffE5CCFF)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: AppColors.primary),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Spacer(),
            if (  pageName == "COMPANY")
              Icon(Icons.edit, color: AppColors.primary), // أيقونة إضافية
          ],
        ),
        SizedBox(height: 10),
        Divider(color: Color(0xffE5CCFF), thickness: 0.5),
        child,
      ],
    ),
  );
}


Widget buildExperienceTile({
  required String title,
  required String subtitle,
  required String imagePath, // استبدل الأيقونة بالصورة
  required int index,
  required bool isLast,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: AppColors.primary,
            child: Text(
              index.toString(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          if (!isLast) // إضافة الخط فقط إذا لم يكن العنصر الأخير
            Container(
              width: 2,
              height: 40, // طول الخط
              color: Colors.purple.shade300,
            ),
        ],
      ),
      const SizedBox(width: 10),
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(subtitle, style: TextStyle(color: Colors.black54)),
          ],
        ),
      ),
    ],
  );
}

Widget buildCertificateTile(String title, String source, pathImage) {
  return ListTile(
    leading: Image.asset(
      pathImage,
      height: 57,
      width: 52,
    ),
    title: Text(title),
    subtitle: Text(source, style: TextStyle(color: Colors.black54)),
  );
}

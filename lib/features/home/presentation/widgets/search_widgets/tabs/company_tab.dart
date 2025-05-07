import 'package:flutter/cupertino.dart';

import '../../../../../../core/utilis/sizes.dart';
import '../search_tabs.dart';

Widget companyTab({required List<Map<String, String>> companies}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start, // محاذاة النص إلى اليسار
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0), // مسافة حول العنوان
        child: Text(
          "Companies", // العنوان الثابت
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      Expanded(
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final user = companies[index];
            return buildSearchTab(
              name: user['name']!,
              job: user['role']!,
              image: user['image']!,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return spaceHeight(0);
          },
          itemCount: companies.length,
        ),
      ),
    ],
  );
}

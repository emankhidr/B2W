import 'package:flutter/cupertino.dart';
import '../../../../../../core/utilis/sizes.dart';
import '../search_tabs.dart';

Widget alluser({required List<Map<String, String>> allUser}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start, // محاذاة النص إلى اليسار
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0), // مسافة حول العنوان
        child: Text(
          "Accounts", // العنوان الثابت
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      Expanded(
        child: ListView.builder (
          itemBuilder: (BuildContext context, int index) {
            final user = allUser[index];
            return buildSearchTab(
              name: user['name']!,
              job: user['role']!,
              image: user['image']!,
            );
          },

          itemCount: allUser.length,
        ),
      ),
    ],
  );
}

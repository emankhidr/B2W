import 'package:b2w/core/utils/colors.dart';
import 'package:flutter/cupertino.dart';

class JobInfo extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const JobInfo({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.lightPrimary,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Image.asset(
              imagePath,
              width: 36,
              height: 36,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color:AppColors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}

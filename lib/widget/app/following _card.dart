import 'package:b2w/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FollowingCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String role;
  final VoidCallback onFollow;

  const FollowingCard({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.role,
    required this.onFollow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,

      decoration: BoxDecoration(
        //  color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(imagePath), // Asset image
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                name,
                style: TextStyle(color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 2),
              Text(
                role,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Spacer(),
          ElevatedButton(
            onPressed: onFollow,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            ),
            child: Text(
              "Unfollow",
              style: TextStyle(color: AppColors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
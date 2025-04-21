import 'package:b2w/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String role;
  final VoidCallback onRemove;

  const PersonCard({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.role,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
       // color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
               style: TextStyle(color: AppColors.black, fontSize: 16,fontWeight: FontWeight.w400),
             ),
             SizedBox(height: 2),
             Text(
               role,
               style: TextStyle(
                 color: AppColors.grey,
                 fontSize: 12,
               ),),
           ],
         ),
          Spacer(),
          GestureDetector(
            onTap: onRemove,
            child: Icon(Icons.close, color: Colors.grey, size: 20),
          ),
        ],
      ),
    );
  }
}
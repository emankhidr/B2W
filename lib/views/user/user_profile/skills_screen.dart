import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/widget/app/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/route_Units/route_units.dart';
import '../../../core/utils/colors.dart';
import '../../../widget/app/app_text.dart';
import 'add_new_experience.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(Icons.arrow_back_ios, color: AppColors.black, size: 40,),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(
          child: Text(
            "Edit Skills",
            style: TextStyle(color: AppColors.black,
                fontSize: 25,
                fontWeight: FontWeight.w400,
                fontFamily: 'Lato'),
          ),
        ),


        elevation: 0,
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 42.h,
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.person,
                        size: 32,
                        color: AppColors.darkGrey,),
                      SizedBox(
                        width: 8.w,
                      ),
                      AppText(title: 'Add Skills',color: AppColors.darkGrey,fontSize: 14,fontWeight: FontWeight.w400,)

                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildChip('Figma'),
                  SizedBox(width: 16),
                  _buildChip('Adobe XD'),
                  SizedBox(width: 16),
                  _buildChip('Illustrator'),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildChip('User Research'),
                  SizedBox(width: 16),
                  _buildChip('Journey Mapping'),

                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildChip('Communication'),
                 

                ],
              ),
              SizedBox(height: 350),
              AppButton(title: 'Save',onTap: (){},)



            ],
          ),
        ),
      ),
    );
  }
}
Widget _buildChip(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: AppColors.lightGrey,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.close,
          size: 18,
          color: AppColors.darkGrey,
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(color: AppColors.darkGrey,fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}


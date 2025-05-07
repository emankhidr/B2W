import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/views/user/user_profile/add_new_education.dart';
import 'package:b2w/views/user/user_profile/edit_education.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../../widget/app/app_text.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

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
            "Edit Education",
            style: TextStyle(color: AppColors.black,
                fontSize: 25,
                fontWeight: FontWeight.w400,
                fontFamily: 'Lato'),
          ),
        ),
        actions: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    RouteUtils.push(context, AddNewEducation());
                  },
                  child:Image.asset('add'.assetPNG,width: 31,height: 31,)
                ),
              ),

            ],
          ),
        ],

        elevation: 0,
        toolbarHeight: 100,
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('mark 1'.assetPNG,
                    width: 52.w,
                    height: 57.h,),
                  SizedBox(
                    width:8.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(title: 'Bachelor of Computer Science',
                        color: AppColors.inputText,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,),
                      SizedBox(
                        height: 4.h,
                      ),
                      AppText(title: 'Mansoura university\n sep2020 - sep2024',color: AppColors.grey,
                        fontSize: 8,
                        fontWeight: FontWeight.w400,)
                    ],
                  ),
                  Spacer(),
                  InkWell(
                      onTap: (){
                        RouteUtils.push(context, EditEducation());
                      },
                      child: Image.asset('assets/images/edit.png',width: 24,height: 24,))

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

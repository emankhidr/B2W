
import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/views/user/user_profile/add_new_experience.dart';
import 'package:b2w/views/user/user_profile/edit_experience.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/route_Units/route_units.dart';
import '../../../core/utils/colors.dart';
import '../../../widget/app/app_text.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

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
            "Edit Experience",
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
                      RouteUtils.push(context, AddNewExperience());
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [

                  Image.asset('bright'.assetPNG,
                    width: 52.w,
                    height: 57.h,),
                  SizedBox(
                    width:8.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(title: 'Bright Media Solutions',
                        color: AppColors.inputText,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,),
                      SizedBox(
                        height: 4.h,
                      ),
                      AppText(title: 'UI/UX designer\n February 2023 – Present',color: AppColors.grey,
                        fontSize: 8,
                        fontWeight: FontWeight.w400,),
                    ],
                  ),
                  Spacer(),
                  InkWell(
                      onTap: (){
                        RouteUtils.push(context,EditExperience());
                      },
                      child: Image.asset('assets/images/edit.png',width: 24,height: 24,))
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [

                  Image.asset('Mask'.assetPNG,
                    width: 52.w,
                    height: 57.h,),
                  SizedBox(
                    width:8.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(title: 'Digital Creative Agency',
                        color: AppColors.inputText,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,),
                      SizedBox(
                        height: 4.h,
                      ),
                      AppText(title: 'UI designer\n July 2022 – January 2023',color: AppColors.grey,
                        fontSize: 8,
                        fontWeight: FontWeight.w400,)
                    ],
                  ),
                  Spacer(),
                  InkWell(
                      onTap: (){
                        RouteUtils.push(context,EditExperience());
                      },
                      child: Image.asset('assets/images/edit.png',width: 24,height: 24,))
                ],
              ),
          ],
        ),



            ],
          ),
        ),
      ),
    );
  }
}

import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/views/user/user_profile/language_screen.dart';
import 'package:b2w/views/user/user_profile/logout_screen.dart';
import 'package:b2w/views/user/user_profile/notifications_screen.dart';
import 'package:b2w/views/user/user_profile/passwords_screen.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(Icons.arrow_back_ios, color: AppColors.black, size: 40),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(
          child: Text(
            "Settings",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 25,
              fontWeight: FontWeight.w400,
              fontFamily: 'Lato',
            ),
          ),
        ),
        elevation: 0,
        toolbarHeight: 100,
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('Language Icon'.assetPNG, width: 36,height: 36,),
                  SizedBox(
                    width: 8.w,
                  ),
                  AppText(title: 'Language',color: AppColors.darkGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      RouteUtils.push(context, LanguageScreen());

                    },
                      child: Icon(Icons.keyboard_arrow_right_sharp,size: 32,color: AppColors.primary,))

                ],
              ),

              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Image.asset('lock'.assetPNG, width: 36,height: 36,),
                  SizedBox(
                    width: 8.w,
                  ),
                  AppText(title: 'Manage passwords',color: AppColors.darkGrey,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,),
                  Spacer(),
                  InkWell(
                      onTap: (){
                        RouteUtils.push(context, PasswordsScreen());

                      },
                      child: Icon(Icons.keyboard_arrow_right_sharp,size: 32,color: AppColors.primary,))

                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Image.asset('alarm'.assetPNG, width: 36,height: 36,),
                  SizedBox(
                    width: 8.w,
                  ),
                  AppText(title: 'Notification settings',color: AppColors.darkGrey,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,),
                  Spacer(),
                  InkWell(
                      onTap: (){
                        RouteUtils.push(context, NotificationsScreen());

                      },
                      child: Icon(Icons.keyboard_arrow_right_sharp,size: 32,color: AppColors.primary,))

                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Image.asset('logout'.assetPNG, width: 36,height: 36,),
                  SizedBox(
                    width: 8.w,
                  ),
                  AppText(title: 'Logout',color: AppColors.darkGrey,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,),
                  Spacer(),
                  InkWell(
                      onTap: (){
                        RouteUtils.push(context,LogoutScreen());

                      },
                      child: Icon(Icons.keyboard_arrow_right_sharp,size: 32,color: AppColors.primary,))

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

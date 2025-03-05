import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/views/Login/login_screen.dart';
import 'package:b2w/views/verify_email/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/colors.dart';
import '../../widget/app/app_buttons.dart';
import '../../widget/app/app_text-field.dart';
import '../../widget/app/app_text.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: AppText(
          title: 'forget password',
          fontWeight: FontWeight.w400,
          fontFamily: 'Lato',
          fontSize: 25.sp,
          textAlign: TextAlign.center,
          color: AppColors.black,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 30.sp,
          ),
          onPressed: () => RouteUtils.push(context,LoginScreen()),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.asset(
              'Forgot password'.assetPNG

              ),
              SizedBox(height: 20.h),
              AppText(
                title:
                ' Forgot your password? Enter your email to recover your account easily',
                fontWeight: FontWeight.w700,
                fontFamily: 'Lato',
                fontSize: 18,
                textAlign: TextAlign.center,
                color: AppColors.inputText,
              ),
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  title: 'Email address',
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                  fontSize: 16.sp,
                  color: AppColors.inputText,
                ),
              ),
              SizedBox(height: 10.h),
              AppTextField(
                hint: 'Example@gmail.com',
                label: 'Email Address ',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 30.h),
          AppButton(
            title: 'Send',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VerifyEmailScreen()),
              );
            },
          ),


            ],
          ),
        ),
      ),

    );
  }
}

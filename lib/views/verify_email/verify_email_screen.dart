import 'package:b2w/core/extentions/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/colors.dart';
import '../../widget/app/app_buttons.dart';
import '../../widget/app/app_text.dart';
import '../create_new_pass/create_new_pass_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: AppText(
          title: 'Verify Your Code',
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
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'Drone Delivery-cuate 1'.assetPNG,

              ),
              SizedBox(height: 20.h),
              AppText(
                title:
                    'A verification code has been sent to your email. Please enter it here to verify your identity.',
                fontWeight: FontWeight.w700,
                fontFamily: 'Lato',
                fontSize: 18.sp,
                textAlign: TextAlign.center,
                color: AppColors.inputText,
              ),
              SizedBox(height: 10.h),
              OtpTextField(
                numberOfFields: 4,
                fieldWidth: 43,
                borderRadius: BorderRadius.circular(10),
                borderWidth: 2,
                cursorColor: Colors.purple,
                focusedBorderColor: Colors.purple,
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {},
              ),
              SizedBox(height: 10.h),
              TextButton(
                onPressed: () {

                },
                child:  AppText(
                     decoration: TextDecoration.underline,
                    title: 'Resend Code?',
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    fontSize: 18.sp,
                    textAlign: TextAlign.center,
                    color: AppColors.primary,
                  ) ),

              SizedBox(height: 30.h),
              AppButton(
                title: 'Verify',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
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

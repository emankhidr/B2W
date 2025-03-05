import 'package:b2w/core/extentions/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/colors.dart';
import '../../widget/app/app_buttons.dart';
import '../../widget/app/app_text.dart';

class PasswordChangedScreen extends StatefulWidget {
  @override
  _PasswordChangedScreenState createState() => _PasswordChangedScreenState();
}

class _PasswordChangedScreenState extends State<PasswordChangedScreen>
    with SingleTickerProviderStateMixin {







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets. symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           Image.asset(
               'Group 131'.assetPNG
                   ),
              SizedBox(height: 20),

              AppText(
                title: ' Your password has been successfully\n changed.',
                fontWeight: FontWeight.w700,
                fontFamily: 'Lato',
                fontSize: 18.sp,
                textAlign: TextAlign.center,
                color: AppColors.inputText,
              ),
              SizedBox(height: 30.h),
              AppButton(title: 'Okay',
                onTap: (){

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

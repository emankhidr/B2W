import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/views/user/home_page/chatbot_options.dart';
import 'package:b2w/widget/app/app_buttons.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';

class ChatbotInterviewScreen extends StatelessWidget {
  const ChatbotInterviewScreen({super.key});

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
            "Chatbot Interview",
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
                child: Icon(
                  Icons.history,
                  color: AppColors.grey,
                  size: 24,
                ),
              ),
              SizedBox(height: 4.h),
              AppText(
                title: 'History',
                color: AppColors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w400,
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
              Center(
                child: AppText(title: 'Welcome! Ready to ace your next ',
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: AppText(title: 'interview ? ',
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 48.h,
              ),
              Image.asset('interview'.assetPNG,width: 350.w,height: 350.h,),
              SizedBox(
                height: 60.h,
              ),
              AppButton(title: 'Get Started',onTap: (){
                RouteUtils.push(context, ChatbotOptions());

              },),


            ],
          ),
        ),
      ),
    );
  }
}

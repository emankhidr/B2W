import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/utils/colors.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccessibilitySettingScreen extends StatefulWidget {
  const AccessibilitySettingScreen({super.key});

  @override
  State<AccessibilitySettingScreen> createState() => _AccessibilitySettingScreenState();
}

class _AccessibilitySettingScreenState extends State<AccessibilitySettingScreen> {
  String? _selectedSize = 'Small';
  bool isToggled = false;
  bool isToggled1 = false;
  bool isToggled2 = false;
  bool isToggled3 = false;
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
            "Accessibility Settings",
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
              SizedBox(
                height: 28.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('font 1'.assetPNG,
                    width: 20.w,
                    height: 20.h,),
                  SizedBox(
                    width: 4.w,
                  ),
                  AppText(title: 'Fonts',
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,)

                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(title: 'FontSize',
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,),
                  SizedBox(
                    height: 4.h,
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start, // Centers the buttons
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Small',
                        groupValue: _selectedSize,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedSize = value;
                          });
                        },
                        activeColor: AppColors.primary,
                      ),
                      Text('Small'),
                    ],
                  ),
                  SizedBox(width: 38.w), // Space between radio buttons
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Medium',
                        groupValue: _selectedSize,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedSize = value;
                          });
                        },
                        activeColor:AppColors.primary,
                      ),
                      Text('Medium'),
                    ],
                  ),
                  SizedBox(width: 38.w), // Space between radio buttons
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Large',
                        groupValue: _selectedSize,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedSize = value;
                          });
                        },
                        activeColor: AppColors.primary,
                      ),
                      Text('Large'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  AppText(title: 'Line Hight',color: AppColors.black
                    ,fontSize: 16,
                    fontWeight: FontWeight.w400,),
                  Spacer(),
                  Switch(
                    value: isToggled,
                    onChanged: (bool value) {
                      setState(() {
                        isToggled = value; // Toggle state
                      });
                    },
                    activeColor: AppColors.white,
                    activeTrackColor: AppColors.primary,
                    inactiveThumbColor: AppColors.primary,
                    inactiveTrackColor: AppColors.lightGrey,
                  ),



                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  AppText(title: 'Word Spacing',color: AppColors.black
                    ,fontSize: 16,
                    fontWeight: FontWeight.w400,),
                  Spacer(),
                  Switch(
                    value: isToggled1,
                    onChanged: (bool value) {
                      setState(() {
                        isToggled1 = value; // Toggle state
                      });
                    },
                    activeColor: AppColors.white,
                    activeTrackColor: AppColors.primary,
                    inactiveThumbColor: AppColors.primary,
                    inactiveTrackColor: AppColors.lightGrey,

                  ),

                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('color'.assetPNG,
                    width: 20.w,
                    height: 20.h,),
                  SizedBox(
                    width: 4.w,
                  ),
                  AppText(title: 'Colors',
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,)

                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  AppText(title: 'Contrast Mode',color: AppColors.black
                    ,fontSize: 16,
                    fontWeight: FontWeight.w400,),
                  Spacer(),
                  Switch(
                    value: isToggled2,
                    onChanged: (bool value) {
                      setState(() {
                        isToggled2 = value; // Toggle state
                      });
                    },
                    activeColor: AppColors.white,
                    activeTrackColor: AppColors.primary,
                    inactiveThumbColor: AppColors.primary,
                    inactiveTrackColor: AppColors.lightGrey,

                  ),

                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  AppText(title: 'Dark Mode',color: AppColors.black
                    ,fontSize: 16,
                    fontWeight: FontWeight.w400,),
                  Spacer(),
                  Switch(
                    value: isToggled3,
                    onChanged: (bool value) {
                      setState(() {
                        isToggled3 = value; // Toggle state
                      });
                    },
                    activeColor: AppColors.white,
                    activeTrackColor: AppColors.primary,
                    inactiveThumbColor: AppColors.primary,
                    inactiveTrackColor: AppColors.lightGrey,

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

import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  String _selectedOption = 'Allow';
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
            "Notification Settings",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Center(child: Image.asset('Notification img'.assetPNG,width: 250.w,height: 250.h,)),
                SizedBox(
                  height: 16.h,
                ),
                AppText(title: 'Do you want to allow notifications to \n          receive all updates?',
                color: AppColors.inputText,
                fontWeight: FontWeight.w700,
                fontSize: 18,),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Allow',
                          groupValue: _selectedOption,
                          activeColor: AppColors.primary,
                          fillColor: MaterialStateColor.resolveWith((states) {
                            return AppColors.primary;
                          }),
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value!;
                            });
                          },
                        ),
                        Text(
                          "Allow",
                          style: TextStyle(fontSize: 18,color: AppColors.darkGrey,fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Don\'t Allow',
                          groupValue: _selectedOption,
                          activeColor: AppColors.primary,
                          fillColor: MaterialStateColor.resolveWith((states) {
                            return AppColors.primary;
                          }),
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value!;
                            });
                          },
                        ),
                        Text(
                          "Don't Allow",
                          style: TextStyle(fontSize: 18,color: AppColors.darkGrey,fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Center(
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                      width: 358,
                      height: 42,
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(
                          color: AppColors.lightGrey,
                        ),

                      ),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: AppColors.darkGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),

    );
  }
}

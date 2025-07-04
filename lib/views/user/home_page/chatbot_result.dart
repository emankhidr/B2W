import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/features/main_page.dart';
import 'package:b2w/views/user/home_page/home_page_screen.dart';
import 'package:b2w/widget/app/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/colors.dart';
import 'package:b2w/core/extentions/string.dart';

class ChatbotResult extends StatelessWidget {
  final String feedback;

  const ChatbotResult({super.key, required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.veryLight,
      appBar: AppBar(
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(Icons.arrow_back_ios, color: AppColors.black, size: 40),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  child: Image.asset('Mask group'.assetPNG),
                ),
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: ClipOval(
                      child: Image.asset('robot'.assetPNG),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 4.w),
            Text(
              "Interview chat",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 25,
                fontWeight: FontWeight.w400,
                fontFamily: 'Lato',
              ),
            ),
          ],
        ),
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  feedback,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.inputText,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
           AppButton(
             title: 'Done',
             onTap: (){
               RouteUtils.push(context, HomePageScreen());
             },
           )
          ],
        ),
      ),
    );
  }
}

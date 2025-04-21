import 'package:b2w/core/extentions/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';

class ChatbotResult extends StatelessWidget {
  const ChatbotResult({super.key});

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
        title: Row(
          children: [
            Stack(
              children: [
                // Background / larger image
                Container(
                  width: 60,
                  height: 60,
                  child: Image.asset(
                    'Mask group'.assetPNG,
                    width: 60,
                    height: 60,
                  ),
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
                      child: Image.asset(
                        'robot'.assetPNG,
                        width: 36,
                        height: 36,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              "Interview chat",
              style: TextStyle(color: AppColors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Lato'),
            ),

          ],
        ),


        elevation: 0,
        toolbarHeight: 100,
      ),
    );
  }
}

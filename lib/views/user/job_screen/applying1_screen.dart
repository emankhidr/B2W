import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/core/utils/colors.dart';
import 'package:b2w/views/user/job_screen/job_details_description.dart';
import 'package:b2w/widget/app/app_buttons.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Applying1Screen extends StatelessWidget {
  const Applying1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 90.h,
                ),
                Image.asset('Ok-amico 1'.assetPNG,
                width: 300.w,
                height: 300.h,),
                SizedBox(
                  height: 8.h,
                ),
                 Center(
                   child: AppText(title: 'Your application has been sent\n             successfully.',
                   color: AppColors.black,
                   fontSize: 18,
                   fontWeight: FontWeight.w600,),
                 ),
                SizedBox(
                  height: 150.h,
                ),
                AppButton(title: 'Done',
                onTap: (){
                  RouteUtils.push(context, JobDetailsDescription());
                },)

              ],
            ),
          ),
        ),
      ),
    );
  }
}

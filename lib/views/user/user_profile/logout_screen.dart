import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/app/app_text.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 358.w,
        height: 300.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.r)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('heart 1'.assetPNG,width: 100,height: 100,)),
            SizedBox(
              height: 16.h,
            ),
            AppText(title: 'Do you want to log out now? \n We’ll be here when you return!',
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w400,
              fontSize: 18,),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                      width: 140.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: AppColors.primary
                        ),
                      ),
                      child: Center(
                        child: AppText(title: 'Cansel',color: AppColors.primary,fontWeight: FontWeight.w700,
                          fontSize: 16,),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                      width: 140.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                            color: AppColors.primary
                        ),
                      ),
                      child: Center(
                        child: AppText(title: 'Log out',color: AppColors.white,fontWeight: FontWeight.w700,
                          fontSize: 16,),
                      ),
                    ),
                  ),


                ],
              ),
            )

          ],
          
        ),
      ),
    );
  }
}

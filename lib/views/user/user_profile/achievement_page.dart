import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/core/utils/colors.dart';
import 'package:b2w/views/user/user_profile/add_new_millstone.dart';
import 'package:b2w/views/user/user_profile/add_new_project.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(title: 'Millstones TimeLine ',color: AppColors.inputText,
                fontWeight: FontWeight.w700,
                fontSize: 16,
                fontFamily: 'Lato',
                ),
                Spacer(),
                InkWell(
                  onTap: (){
                    RouteUtils.push(context, AddNewMillstone());
                  },

                  child: Image.asset('add'.assetPNG,width: 32.w,
                  height: 32.h,),
                )

              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(title: 'Projects ',color: AppColors.inputText,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontFamily: 'Lato',
                ),
                Spacer(),
                InkWell(
                  onTap: (){
                    RouteUtils.push(context, AddNewProject());
                  },

                  child: Image.asset('add'.assetPNG,width: 32.w,
                    height: 32.h,),
                )

              ],
            ),
          ),

        ],
      ),
    );
  }
}

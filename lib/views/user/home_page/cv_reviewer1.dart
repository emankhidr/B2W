import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/views/user/nav_bar/nav_bar.dart';
import 'package:b2w/widget/app/app_buttons.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:b2w/widget/app/cv%20_suggetion.dart';
import 'package:b2w/widget/app/cv_check_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../../widget/app/circle_progrwss_painter.dart';

class CvReviewer1 extends StatelessWidget {
  const CvReviewer1({super.key});

  final double percentage = 0.75; // Change this value to update the circle (0.0 to 1.0)

  String getCvState(double percentage) {
    if (percentage >= 0.9) return "Excellent";
    if (percentage >= 0.75) return "Very Good";
    if (percentage >= 0.5) return "Good";
    return "Needs Improvement";
  }
  Color getColor(double percentage) {
    // Fade effect from transparent to full AppColors.primary
    return AppColors.primary;
  }

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
            "Resume Reviewer",
            style: TextStyle(color: AppColors.black,
                fontSize: 25,
                fontWeight: FontWeight.w400,
                fontFamily: 'Lato'),
          ),
        ),
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: AppText(
                  title: 'Your Score',
                  color: AppColors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomPaint(
                foregroundPainter: CircleProgressPainter(
                  percentage: percentage,
                  color: getColor(percentage),
                ),

                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${(percentage * 100).toInt()}%",
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          getCvState(percentage),
                          style: TextStyle(
                            fontSize: 14,
                            color:AppColors.grey,
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),

              CvChecklistWidget(),
              SizedBox(
                height: 10.h ,
              ),
              Divider(
                color: AppColors.lightGrey,
                height: 1,
                thickness: 1,

              ),
              SizedBox(
                height: 10.h,
              ),
              CvSuggestionsWidget(),
              SizedBox(
                height: 60.h,
              ),
              AppButton(title: 'Back To Home',
              onTap: (){
                RouteUtils.push(context, NavBarScreen());
              },)


            ],
          ),
        ),
      ),

    );
  }
}

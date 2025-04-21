import 'package:b2w/views/user/job_screen/search_job%202.dart';
import 'package:b2w/widget/app/recent_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/route_Units/route_units.dart';
import '../../../core/utils/colors.dart';
import '../../../widget/app/app_text.dart';

class SearchJob1 extends StatelessWidget {
  const SearchJob1({super.key});

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

        actions: [
          GestureDetector(
            onTap: (){
              RouteUtils.push(context, SearchJob2());
            },
            child: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Container(
                width: 300.w,
                height: 42.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: AppColors.lightPrimary,
                      width: 2.w
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.search_sharp,
                        size: 24,
                        color: AppColors.primary,),
                      SizedBox(
                        width: 8.w,
                      ),
                      AppText(title: 'Search your dream Job',color: AppColors.grey,fontSize: 18,fontWeight: FontWeight.w400,),
                      Spacer(),
                      Icon(Icons.mic_none_rounded,
                        size: 20,
                        color: AppColors.grey,),

                    ],
                  ),
                ),
              ),
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.access_time_outlined,
                  size: 18,
                  color: AppColors.grey,),
                  SizedBox(
                    width:4.w ,
                  ),
                  AppText(title: 'Recent',color: AppColors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,)


                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              RecentsCard(
                text: 'UI designer',
              ),
              RecentsCard(
                text: 'Sales',
              ),
              RecentsCard(
                text: 'Call center',

              ),
            ],
          ),
        ),
      ),
    );
  }
}

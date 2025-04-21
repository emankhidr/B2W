import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/route_Units/route_units.dart';
import '../../../core/utils/colors.dart';
import '../../../widget/app/app_text.dart';
import '../../../widget/app/job-card.dart';

class SearchJob2 extends StatelessWidget {
  const SearchJob2({super.key});

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
                width: 270.w,
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
                      AppText(title: 'front end developer',color: AppColors.grey,fontSize: 18,fontWeight: FontWeight.w400,),
                      Spacer(),
                      Icon(Icons.mic_none_rounded,
                        size: 20,
                        color: AppColors.grey,),

                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.filter_list_alt,
              color: AppColors.grey,
              size: 26,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              JobCard(
                companyName: 'Google',
                logoAsset: 'assets/images/google.png',
                postedTime: ' 5 days',
                jobTitle: 'Front-end Developer ',
                tag1: 'Part-time',
                tag2: 'Remotely',
                salary: '\$50-70K',
                location: 'New York , NY',
                onMoreDetails: (){

                },),
              SizedBox(
                height: 4.h,
              ),
              JobCard(
                companyName: 'Dell',
                logoAsset: 'assets/images/dell.png',
                postedTime: ' 5 days',
                jobTitle: 'Front-end Developer',
                tag1: 'Part-time',
                tag2: 'Remotely',
                salary: '\$50-70K',
                location: 'New York , NY',
                onMoreDetails: (){

                },),
              SizedBox(
                height: 4.h,
              ),
              JobCard(
                companyName: 'Apple',
                logoAsset: 'assets/images/apple.png',
                postedTime: ' 5 days',
                jobTitle: 'Front-end Developer',
                tag1: 'Part-time',
                tag2: 'Remotely',
                salary: '\$50-70K',
                location: 'New York , NY',
                onMoreDetails: (){

                },),
              SizedBox(
                height: 4.h,
              ),


            ],
          ),
        ),
      ),
    );
  }
}

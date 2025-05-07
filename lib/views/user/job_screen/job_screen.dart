import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/views/user/job_screen/filter_job.dart';
import 'package:b2w/views/user/job_screen/search_job1.dart';
import 'package:b2w/widget/app/job-card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/route_Units/route_units.dart';
import '../../../core/utils/colors.dart';
import '../../../widget/app/app_text.dart';


class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: (){
            RouteUtils.push(context, SearchJob1());
          },
          child: Container(
            width: double.infinity,
            height: 42.h,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.search,
                    size: 32,
                    color: AppColors.darkGrey,),
                  SizedBox(
                    width: 8.w,
                  ),
                  AppText(title: 'Search',color: AppColors.darkGrey,fontSize: 14,fontWeight: FontWeight.w400,)
          
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(title: 'Recommended job',color: AppColors.inputText,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      RouteUtils.push(context, FilterJob());
                    },
                    child: Icon(
                      Icons.filter_list_alt,
                      color: AppColors.grey,
                      size: 26,
                    ),
                  )

                ],
              ),
              SizedBox(
                height: 21.h,
              ),
              JobCard(
                  companyName: 'Google',
                  logoAsset: 'assets/images/google.png',
                  postedTime: ' 5 days',
                  jobTitle: 'Senior UX Designer ',
                  tag1: 'Part-time',
                  tag2: 'Remotely',
                  salary: '\$50-70K',
                  location: 'New York , NY',
             ),
              SizedBox(
                height: 4.h,
              ),
              JobCard(
                companyName: 'Digital Creative Agency',
                logoAsset: 'assets/images/Job header img.png',
                postedTime: ' 2 weeks ago',
                jobTitle: 'Junior UI Designer',
                tag1: 'Full-time',
                tag2: 'In-office',
                salary: '\$40-50K',
                location: 'Los Angeles\n CA',
               ),
              
            ],
          ),
        ),
      ),
    );
  }
}

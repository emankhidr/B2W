import 'package:b2w/widget/app/Job_applied_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';

class AppliedJobs extends StatelessWidget {
  const AppliedJobs({super.key});

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
            "Your Applications",
            style: TextStyle(color: AppColors.black,
                fontSize: 25,
                fontWeight: FontWeight.w400,
                fontFamily: 'Lato'),
          ),
        ),
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              JobAppliedCard(
                  companyName: 'Google',
                  logoAsset: 'assets/images/google.png',
                  postedTime: ' 5 days',
                  jobTitle: 'Senior UX Designer',
                  tag1: 'Part-time',
                  tag2: 'Remotely',
                  salary: '\$50-70K',
                  location: 'New York , NY',
                  applicationStatus: 'accepted',
                onMoreDetails: (){

                },),
              SizedBox(
                height: 8.h,
              ),
              JobAppliedCard(
                companyName: 'Apple',
                logoAsset: 'assets/images/apple.png',
                postedTime: ' 5 days',
                jobTitle: 'Senior UX Designer',
                tag1: 'Part-time',
                tag2: 'Remotely',
                salary: '\$50-70K',
                location: 'New York , NY',
                applicationStatus: 'rejected',
                onMoreDetails: (){

                },),
              SizedBox(
                height: 8.h,
              ),
              JobAppliedCard(
                companyName: 'Netflix',
                logoAsset: 'assets/images/Netflix.png',
                postedTime: ' 5 days',
                jobTitle: 'Senior UX Designer',
                tag1: 'Part-time',
                tag2: 'Remotely',
                salary: '\$50-70K',
                location: 'New York , NY',
                applicationStatus: 'pending',
                onMoreDetails: (){

                },),
              SizedBox(
                height: 8.h,
              ),



            ],
          ),
        ),
      ),
    );
  }
}

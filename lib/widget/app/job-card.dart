import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/core/utils/colors.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:b2w/views/user/job_screen/job_details_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobCard extends StatefulWidget {

  final String companyName;
  final String logoAsset;
  final String postedTime;
  final String jobTitle;
  final String tag1;
  final String tag2;
  final String salary;
  final String location;
  final VoidCallback? onMoreDetails;

  const JobCard({
    super.key,

    required this.companyName,
    required this.logoAsset,
    required this.postedTime,
    required this.jobTitle,
    required this.tag1,
    required this.tag2,
    required this.salary,
    required this.location,
    this.onMoreDetails,
  });

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  bool isBookmarked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358,
      height: 262.h,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.lightGrey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top row: Logo, time ago, bookmark icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    widget.logoAsset,
                    width: 55,
                    height: 55,
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.companyName,
                        style: const TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.postedTime,
                        style: const TextStyle(
                          color: AppColors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isBookmarked = !isBookmarked; // toggle the icon
                  });
                },
                child: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: isBookmarked ? AppColors.primary : AppColors.lightPrimary,
                )
              ),],
          ),

          const SizedBox(height: 16),

          /// Job Title
          Text(
            widget.jobTitle,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 16),

          /// Job Tags
          Row(
            children: [
              Chip(
                label: Text(widget.tag1),
                backgroundColor: AppColors.lightPrimary,
                labelStyle: const TextStyle(color: AppColors.darkGrey),
              ),
              const SizedBox(width: 8),
              Chip(
                label: Text(widget.tag2),
                backgroundColor: AppColors.lightPrimary,
                labelStyle: const TextStyle(color: AppColors.darkGrey),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// Line
          Container(
            height: 2,
            width: 300,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.grey, AppColors.primary],
              ),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            widget.salary,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          /// Location and Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.location,
                style: const TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              GestureDetector(
                onTap: (){
                  RouteUtils.push(context, JobDetailsDescription());
                },
                child: Container(
                  width: 117.w,
                  height: 26.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Center(
                    child: AppText(
                      title: 'More Details...',
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
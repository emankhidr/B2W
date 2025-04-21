import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/route_Units/route_units.dart';
import '../../core/utils/colors.dart';
import '../../views/user/job_screen/job_details_description.dart';
import 'app_text.dart';

class JobAppliedCard extends StatelessWidget {
  final String companyName;
  final String logoAsset;
  final String postedTime;
  final String jobTitle;
  final String tag1;
  final String tag2;
  final String salary;
  final String location;
  final String applicationStatus; // New status prop
  final VoidCallback? onMoreDetails;

  const JobAppliedCard({
    super.key,
    required this.companyName,
    required this.logoAsset,
    required this.postedTime,
    required this.jobTitle,
    required this.tag1,
    required this.tag2,
    required this.salary,
    required this.location,
    required this.applicationStatus, // Initialize status
    this.onMoreDetails,
  });

  Color _getStatusColor() {
    switch (applicationStatus.toLowerCase()) {
      case 'accepted':
        return const Color(0xFFBFFFE1);
      case 'rejected':
        return const Color(0xFFFFBBC2);
      case 'pending':
      default:
      return  AppColors.lightGrey;
    }
  }

  String _getStatusText() {
    switch (applicationStatus.toLowerCase()) {
      case 'accepted':
        return 'Accepted';
      case 'rejected':
        return 'Rejected';
      case 'pending':
      default:
        return 'Pending';
    }
  }
  Color _getStatusTextColor() {
    switch (applicationStatus.toLowerCase()) {
      case 'accepted':
        return const Color(0xFF2BD057);
      case 'rejected':
        return const Color(0xFFFF4A4A);
      case 'pending':
      default:
      return const Color(0xFF504D4D);
    }
  }

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
          /// Top row: Logo, time ago, status container
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    logoAsset,
                    width: 55,
                    height: 55,
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        companyName,
                        style: const TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        postedTime,
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

              /// Status container
              Container(
                width: 88.w,
                height: 27.h,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: _getStatusColor(),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Center(
                  child: Text(
                    _getStatusText(),
                    style: TextStyle(
                      color: _getStatusTextColor(),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// Job Title
          Text(
            jobTitle,
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
                label: Text(tag1),
                backgroundColor: AppColors.lightPrimary,
                labelStyle: const TextStyle(color: AppColors.darkGrey),
              ),
              const SizedBox(width: 8),
              Chip(
                label: Text(tag2),
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
            salary,
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
                location,
                style: const TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              GestureDetector(
                onTap: () {
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
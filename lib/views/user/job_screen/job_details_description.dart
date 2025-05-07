import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/views/user/job_screen/applying_screen.dart';
import 'package:b2w/widget/app/job_info.dart';
import 'package:b2w/widget/app/app_buttons.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../../widget/app/job_items.dart';

class JobDetailsDescription extends StatefulWidget {
  const JobDetailsDescription({super.key});

  @override
  State<JobDetailsDescription> createState() => _JobDetailsDescriptionState();
}

class _JobDetailsDescriptionState extends State<JobDetailsDescription> {
  int selectedIndex = 0;
  bool isBookmarked = false;
  final List<Widget> pages = const [
    Text("This job requires you to create top-notch user experiences, collaborate with the product team, and more.", style: TextStyle(color: AppColors.black, fontSize: 14, fontWeight: FontWeight.w400)),
    Text("Requirements: 3+ years in UX design, strong portfolio, experience with Figma and Adobe XD.", style: TextStyle(color: AppColors.black, fontSize: 14, fontWeight: FontWeight.w400)),
    Text("Google is a global leader in tech with a mission to organize the world’s information and make it universally accessible.", style: TextStyle(color: AppColors.black, fontSize: 14, fontWeight: FontWeight.w400)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              decoration: const BoxDecoration(
                color: AppColors.lightPrimary, // light purple
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(180),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row: Back arrow and bookmark
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.arrow_back_ios, color: AppColors.black, size: 35,),
                      SizedBox(
                        width: 50,
                      ),
                      AppText(title: 'Senior UX Designer ', color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lato',
                      fontSize: 21,),
                     Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isBookmarked = !isBookmarked; // toggle the icon
                          });
                        },
                        child: Icon(
                          isBookmarked ? Icons.bookmark : Icons.bookmark_border,

                          color: isBookmarked ? AppColors.primary : AppColors.darkGrey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Job title
                  const Text(
                    "Senior UX Designer",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Company info
                  Row(
                    children: [
                      // Google logo (you can use Image.asset or NetworkImage)
                     Image.asset('google'.assetPNG,
                     width: 55,
                     height: 55,),
                      // Company name and time
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Google", style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15, color: AppColors.black)),
                          Text("5 days ago", style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20, color: AppColors.darkGrey)),
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Position again + location
                  const Text(
                    "Senior UX Designer",
                    style: TextStyle(fontSize: 21,fontWeight: FontWeight.w400,color: AppColors.black ),
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color:AppColors.darkGrey),
                      SizedBox(width: 4),
                      Text("Mansoura", style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20, color: AppColors.darkGrey)),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(

              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                JobInfo(
                  imagePath: 'assets/images/level.png',
                  title: 'Level',
                  subtitle: 'Senior',
                ),
                JobInfo(
                  imagePath: 'assets/images/job icon.png',
                  title: 'Job type',
                  subtitle: 'Part-time',
                ),

                JobInfo(
                  imagePath: 'assets/images/salary.png',
                  title: 'Salary',
                  subtitle: '\$50-70K',
                ),

                JobInfo(
                  imagePath: 'assets/images/user 1.png',
                  title: 'Working model',
                  subtitle: 'Remotely',
                ),

              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                JobItems(
                  label: "Description",
                  isSelected: selectedIndex == 0,
                  onTap: () => setState(() => selectedIndex = 0),
                ),
                JobItems(
                  label: "Requirements",
                  isSelected: selectedIndex == 1,
                  onTap: () => setState(() => selectedIndex = 1),
                ),
                JobItems(
                  label: "Company",
                  isSelected: selectedIndex == 2,
                  onTap: () => setState(() => selectedIndex = 2),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Content below toggle
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: pages[selectedIndex],
      ),
            SizedBox(
              height: 160.h,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AppButton(
                title: 'Apply for the job',
                onTap: (){
                  RouteUtils.push(context, ApplyingScreen());
                },
              ),
            ),

          ],
        ),
      ),

    );
  }
}

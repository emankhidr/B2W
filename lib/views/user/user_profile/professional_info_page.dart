import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/core/utils/colors.dart';
import 'package:b2w/views/user/user_profile/about_screen.dart';
import 'package:b2w/views/user/user_profile/cetificaions_screen.dart';
import 'package:b2w/views/user/user_profile/cv_screen.dart';
import 'package:b2w/views/user/user_profile/education_screen.dart';
import 'package:b2w/views/user/user_profile/experience_screen.dart';
import 'package:b2w/views/user/user_profile/skills_screen.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfessionalInfoPage extends StatelessWidget {
  const ProfessionalInfoPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 358.w ,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                      color: AppColors.lightGrey
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Image.asset('assets/images/about.png',width: 18, height: 20,),
                            SizedBox(
                              width: 4.w,
                            ),
                            AppText(
                              title: 'About me',
                              color: AppColors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                            Spacer(),
                            InkWell(
                                onTap: (){
                                  RouteUtils.push(context, AboutScreen());
                                },
                                child: Image.asset('assets/images/edit.png',width: 24,height: 24,))
                          ],
                        ),
                      ),
                      Divider(
                        color: AppColors.lightGrey,
                        indent: 20, // Indentation from the left
                        endIndent: 20,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      AppText(title: 'Enim qui nisi non voluptas. Autem eligendi vel aut dolore iure. Ut vel placeat sit. Illo iusto ipsam architecto iste quia voluptas debitis. Laboriosam voluptatum cum nisi et aut reiciendis saepe. Et voluptas rem.',
                        color: AppColors.darkGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              width: 358.w ,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                    color: AppColors.lightGrey
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image.asset('assets/images/education.png',width: 18, height: 20,),
                          SizedBox(
                            width: 4.w,
                          ),
                          AppText(
                            title: 'Education',
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                          Spacer(),
                          InkWell(
                              onTap: (){
                                RouteUtils.push(context, EducationScreen());
                              },
                              child: Image.asset('assets/images/edit.png',width: 24,height: 24,))
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.lightGrey,
                      indent: 20, // Indentation from the left
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Image.asset('mark 1'.assetPNG,
                        width: 52.w,
                        height: 57.h,),
                        SizedBox(
                          width:8.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(title: 'Bachelor of Computer Science',
                            color: AppColors.inputText,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,),
                            SizedBox(
                              height: 4.h,
                            ),
                           AppText(title: 'Mansoura university\n sep2020 - sep2024',color: AppColors.grey,
                             fontSize: 8,
                             fontWeight: FontWeight.w400,)
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              width: 358.w ,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                    color: AppColors.lightGrey
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image.asset('assets/images/experience.png',width: 18, height: 20,),
                          SizedBox(
                            width: 4.w,
                          ),
                          AppText(
                            title: 'Experience',
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                          Spacer(),
                          InkWell(
                              onTap: (){
                                RouteUtils.push(context, ExperienceScreen());
                              },
                              child: Image.asset('assets/images/edit.png',width: 24,height: 24,))
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.lightGrey,
                      indent: 20, // Indentation from the left
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('one'.assetPNG,width: 20,
                            height: 20,),
                            SizedBox(
                              width: 8.w,
                            ),
                            Image.asset('bright'.assetPNG,
                              width: 52.w,
                              height: 57.h,),
                            SizedBox(
                              width:8.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(title: 'Bright Media Solutions',
                                  color: AppColors.inputText,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,),
                                SizedBox(
                                  height: 4.h,
                                ),
                                AppText(title: 'UI/UX designer\n February 2023 – Present',color: AppColors.grey,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,)
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            Image.asset('two'.assetPNG,width: 20,
                              height: 20,),
                            SizedBox(
                              width: 8.w,
                            ),
                            Image.asset('Mask'.assetPNG,
                              width: 52.w,
                              height: 57.h,),
                            SizedBox(
                              width:8.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(title: 'Digital Creative Agency',
                                  color: AppColors.inputText,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,),
                                SizedBox(
                                  height: 4.h,
                                ),
                                AppText(title: 'UI designer\n July 2022 – January 2023',color: AppColors.grey,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,)
                              ],
                            ),
                          ],
                        ),
                      ],
                    )

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              width: 358.w ,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                    color: AppColors.lightGrey
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image.asset('assets/images/skills.png',width: 18, height: 20,),
                          SizedBox(
                            width: 4.w,
                          ),
                          AppText(
                            title: 'Skills',
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                          Spacer(),
                          InkWell(
                              onTap: (){
                                RouteUtils.push(context, SkillsScreen());
                              },
                              child: Image.asset('assets/images/edit.png',width: 24,height: 24,))
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.lightGrey,
                      indent: 20, // Indentation from the left
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Row(
                    children: [
                    Container(
                    width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Figma',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.inputText,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 14.h,
                ),
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Adobe XD',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.inputText,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Illustrator',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.inputText,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 14.h,
                        ), Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'User Research',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.inputText,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                 Row(
              children: [
              Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
              color: AppColors.grey,
              shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 4),
            Text(
              'Journey Mapping',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.inputText,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 14.h,
        ),
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Communication',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.inputText,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 14.h,
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              width: 358.w ,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                    color: AppColors.lightGrey
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image.asset('assets/images/certification.png',width: 18, height: 20,),
                          SizedBox(
                            width: 4.w,
                          ),
                          AppText(
                            title: ' Certificates & License',
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                          Spacer(),
                          InkWell(
                              onTap: (){
                                RouteUtils.push(context, CertificationScreen());
                              },
                              child: Image.asset('assets/images/edit.png',width: 24,height: 24,))
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.lightGrey,
                      indent: 20, // Indentation from the left
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Image.asset('certificate'.assetPNG,
                          width: 52.w,
                          height: 57.h,),
                        SizedBox(
                          width:8.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(title: 'Google UX Design Certificate',
                              color: AppColors.inputText,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,),
                            SizedBox(
                              height: 4.h,
                            ),
                            AppText(title: 'Coursera',color: AppColors.grey,
                              fontSize: 8,
                              fontWeight: FontWeight.w400,)
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Image.asset('udemy'.assetPNG,
                          width: 52.w,
                          height: 57.h,),
                        SizedBox(
                          width:8.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(title: 'Advanced Figma Masterclass',
                              color: AppColors.inputText,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,),
                            SizedBox(
                              height: 4.h,
                            ),
                            AppText(title: 'Udemy',color: AppColors.grey,
                              fontSize: 8,
                              fontWeight: FontWeight.w400,)
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              width: 358.w ,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                    color: AppColors.lightGrey
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image.asset('assets/images/cv.png',width: 18, height: 20,),
                          SizedBox(
                            width: 4.w,
                          ),
                          AppText(
                            title: 'Resume/CV',
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                          Spacer(),
                          InkWell(
                              onTap: (){
                                RouteUtils.push(context, CvScreen());
                              },
                              child: Image.asset('assets/images/edit.png',width: 24,height: 24,))
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.lightGrey,
                      indent: 20, // Indentation from the left
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Image.asset('certificate'.assetPNG,
                          width: 52.w,
                          height: 57.h,),
                        SizedBox(
                          width:8.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(title: 'Google UX Design Certificate',
                              color: AppColors.inputText,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,),
                            SizedBox(
                              height: 4.h,
                            ),
                            AppText(title: 'Coursera',color: AppColors.grey,
                              fontSize: 8,
                              fontWeight: FontWeight.w400,)
                          ],
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

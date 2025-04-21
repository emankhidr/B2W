import 'package:b2w/core/extentions/num.dart';
import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/core/utils/colors.dart';
import 'package:b2w/views/user/user_profile_setup//profile_setup_card.dart';
import 'package:b2w/widget/app/app_buttons.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../company/company_profile/company_info_screen.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  bool isSelected = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets. symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(title: 'Please select one of the following',
                color: AppColors.dark,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                fontSize: 21,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8.h ,
              ),
              AppText(title: 'You are a/an ',
                color: AppColors.dark,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                fontSize: 17,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height:20.h ,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Expanded(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                             isSelected = true;
                          });
                        },
                  child: Container(
                    width: 118.w,
                    height: 118.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(
                        color: isSelected ? AppColors.primary : Colors.transparent,

                      ),
                    ),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          isSelected? AppColors.primary : AppColors.grey,
                          BlendMode.saturation,
                        ),
                            child: Image.asset(
                              'employee'.assetPNG, // Replace with your image path
                            ),
                          ),

                        ),
                      ),
                      ),

                      SizedBox(
                        width: 20.w,
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = false;
                          });
                        },
                        child: Container(
                          width: 118.w,
                          height: 118.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            border: Border.all(
                              color: isSelected ? AppColors.primary : Colors.transparent,

                            ),
                          ),

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.r),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                isSelected? AppColors.grey : AppColors.primary,
                                BlendMode.saturation,
                              ),
                            child: Image.asset(
                              'company'.assetPNG, // Replace with your image path
                            ),
                          ),

                        ),
                      ),
                      ),
                    ],
                  ),
                ),

              ),

               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 40),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,

                   children: [
                     AppText(title: 'Employee',
                       color: AppColors.dark,
                       fontSize: 17,
                       fontWeight: FontWeight.w700,
                       fontFamily: 'Lato',),
                     SizedBox(
                       width: 80.w,
                     ),
                     AppText(title: 'Company',
                       color: AppColors.dark,
                       fontSize: 17,
                       fontWeight: FontWeight.w700,
                       fontFamily: 'Lato',),
                   ],
                 ),
               ),
               SizedBox(
                 height: 32.h,
               ),
               AppButton(title: 'Next',
               onTap: (){
                 setState(() {
                   isSelected ?RouteUtils.push(context, ProfileSetup()):RouteUtils.push(context, CompanyInfoScreen());
                 });
               },)

            ],
          ),
        ),
      ),
    );
  }
}

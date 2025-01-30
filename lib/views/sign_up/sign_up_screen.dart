import 'package:b2w/core/extentions/num.dart';
import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/views/Login/login_screen.dart';
import 'package:b2w/widget/app/app_text-field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/route_Units/route_units.dart';
import '../../core/utils/colors.dart';
import '../../widget/app/app_text.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen ({super.key});

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 294.h,
                child: Image.asset(
                  'Rectangle 2'.assetPNG,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(

                  key: formKey,
                  child: Column(

                    children: [
                      AppText(
                        title: 'Create your Account',
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Lato',
                        fontSize: 21,
                        textAlign: TextAlign.center,
                        color: AppColors.inputText,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: AppTextField(
                              hint: 'first name',
                              label: 'First Name',
                              width: 170.w,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: AppTextField(
                              hint: 'last name',
                              label: 'Last Name',
                              width: 170.w,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      AppTextField
                        (hint: 'Example@gmail.com',
                        label: 'Email Address ' ,
                        keyboardType: TextInputType.emailAddress,

                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      AppTextField
                        (
                        label: 'Password',
                        secure: true,
                        hint: '*******',
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      SizedBox(
                        height: 8.h ,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              height: 2,
                              color: AppColors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          AppText(title: 'OR Sign Up with',
                            color: AppColors.inputText,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: Divider(
                              height: 2,
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
          
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
          
                            child: Image.asset('google'.assetPNG,
                              width: 44.w,
                              height: 44.w,),
                            onTap: (){},
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          InkWell(
                            child: Image.asset('apple'.assetPNG,
                              width: 44.w,
                              height: 44.w,),
                            onTap: (){},
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          InkWell(
                            child: Image.asset('facebook'.assetPNG,
                              width: 44.w,
                              height: 44.w,),
                            onTap: (){},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(title: 'Have an account?',
                            color: AppColors.darkGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,),
                          InkWell(
                            child: AppText(title: 'Log in',
                              color: AppColors.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            onTap: (){
                              RouteUtils.pushAndRemoveAll(context, LoginScreen());
                            },
                          ),
          
                        ],
                      )
          
          
                    ],
                  ),
                ),
              )
          
          
            ],
          ),
        ),
      ),
    );
  }
}

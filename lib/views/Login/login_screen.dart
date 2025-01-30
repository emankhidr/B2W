import 'package:b2w/core/extentions/num.dart';
import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/views/forgort_password/forgot_password.dart';
import 'package:b2w/views/sign_up/sign_up_screen.dart';
import 'package:b2w/widget/app/app_buttons.dart';
import 'package:b2w/widget/app/app_text-field.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
            
                  width: double.infinity,
                  height: 294.height,
                  child: Image.asset(
                    'Rectangle 1'.assetPNG,
                  ),
                  ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      AppText(
                        title: 'Login to your Account',
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Lato',
                        fontSize: 21,
                        textAlign: TextAlign.center,
                        color: AppColors.inputText,
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
                      Align(
                        alignment: Alignment.centerRight,
            
                        child: AppText(title: 'Forgot password?',
                          color:AppColors.grey ,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                          onTap: ()=>RouteUtils.pushAndRemoveAll(context,forgotPassword()),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      AppButton(title: 'Log in',
                          onTap: (){
                        formKey.currentState!.validate();
                          },
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
                          AppText(title: 'OR log in with',
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
                          AppText(title: 'Don’t Have an account?',
                          color: AppColors.darkGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,),
                          InkWell(
                            child: AppText(title: 'Sign up',
                              color: AppColors.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            onTap: (){
                              RouteUtils.pushAndRemoveAll(context, SignUpScreen());
                            },
                          ),
                          
                        ],
                      )
            
            
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

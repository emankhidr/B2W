import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/views/forgort_password/forget_pass_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../../widget/app/app_text-field.dart';
import '../../../widget/app/app_text.dart';

class PasswordsScreen extends StatelessWidget {
  const PasswordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(Icons.arrow_back_ios, color: AppColors.black, size: 40),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(
          child: Text(
            "Manage passwords",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 25,
              fontWeight: FontWeight.w400,
              fontFamily: 'Lato',
            ),
          ),
        ),
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(title: 'Old Password',color: AppColors.inputText,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              AppTextField
                (

                secure: true,
                hint: '*******',
                keyboardType: TextInputType.visiblePassword,
                validator: (value)
                {
                  if (value!.isEmpty)
                  {
                    return 'password must not be empty';

                  }
                  return null;

                },

              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      RouteUtils.push(context, ForgotPasswordScreen());
                    },
                    child: AppText(title: 'Forgot password?',color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(title: 'New password',color: AppColors.inputText,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              AppTextField
                (

                secure: true,
                hint: '*******',
                keyboardType: TextInputType.visiblePassword,
                validator: (value)
                {
                  if (value!.isEmpty)
                  {
                    return 'password must not be empty';

                  }
                  return null;

                },

              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(title: 'Confirm new password',color: AppColors.inputText,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              AppTextField
                (

                secure: true,
                hint: '*******',
                keyboardType: TextInputType.visiblePassword,
                validator: (value)
                {
                  if (value!.isEmpty)
                  {
                    return 'password must not be empty';

                  }
                  return null;

                },

              ),
              SizedBox(
                height: 250,
              ),
              Center(
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    width: 358,
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(
                        color: AppColors.lightGrey,
                      ),

                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: AppColors.darkGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../../widget/app/app_text-field.dart';
import '../../../widget/app/app_text.dart';

class EditCertification extends StatelessWidget {
  const EditCertification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText(title: 'Edit Certificate',color: AppColors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText(title: 'Organization Name',color: AppColors.inputText,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppTextField
                      (hint: 'EX : Google',

                      keyboardType: TextInputType.text,
                      validator: (value)
                      {
                        if (value!.isEmpty)
                        {
                          return 'This field must not be empty';

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
                        AppText(title: 'Course Name',color: AppColors.inputText,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppTextField
                      (hint: 'EX : cyber security',

                      keyboardType: TextInputType.text,
                      validator: (value)
                      {
                        if (value!.isEmpty)
                        {
                          return 'This field must not be empty';

                        }
                        return null;

                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    Center(
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          width: 170,
                          height: 42,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(
                              color: AppColors.lightGrey,
                            ),

                          ),
                          child: Center(
                            child: Text(
                              'Save',
                              style: TextStyle(
                                color: AppColors.white,
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
            ],
          ),
        ),
      ),
    );
  }
}

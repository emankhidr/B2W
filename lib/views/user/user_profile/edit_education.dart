import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../../widget/app/app_text-field.dart';
import '../../../widget/app/app_text.dart';

class EditEducation extends StatelessWidget {
  const EditEducation({super.key});

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
                        AppText(title: 'Edit Education',color: AppColors.black,
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
                        AppText(title: 'Faculty',color: AppColors.inputText,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppTextField
                      (hint: 'EX : Art',

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
                        AppText(title: 'Degree',color: AppColors.inputText,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    AppTextField
                      (hint: 'EX : Bachelor ',

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
                        AppText(title: 'University',color: AppColors.inputText,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    AppTextField
                      (hint: 'EX : Harvard University',

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
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText(title: 'From',color: AppColors.inputText,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                width: 170,
                                height: 42,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: AppColors.grey),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    hint: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(' Month'),
                                    ),
                                    items: [
                                      'January', 'February', 'March', 'April', 'May', 'June',
                                      'July', 'August', 'September', 'October', 'November', 'December'
                                    ].map((month) {
                                      return DropdownMenuItem<String>(
                                        value: month,
                                        child: Text(month),
                                      );
                                    }).toList(),
                                    onChanged: (value) {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                width: 170,
                                height: 42,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: AppColors.grey),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<int>(
                                    hint: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(' Year'),
                                    ),
                                    items: List.generate(11, (index) => 2025 + index)
                                        .map((year) {
                                      return DropdownMenuItem<int>(
                                        value: year,
                                        child: Text(year.toString()),
                                      );
                                    }).toList(),
                                    onChanged: (value) {},
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ) ,
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText(title: 'to',color: AppColors.inputText,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                width: 170,
                                height: 42,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: AppColors.grey),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    hint: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(' Month'),
                                    ),
                                    items: [
                                      'January', 'February', 'March', 'April', 'May', 'June',
                                      'July', 'August', 'September', 'October', 'November', 'December'
                                    ].map((month) {
                                      return DropdownMenuItem<String>(
                                        value: month,
                                        child: Text(month),
                                      );
                                    }).toList(),
                                    onChanged: (value) {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                width: 170,
                                height: 42,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: AppColors.grey),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<int>(
                                    hint: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(' Year'),
                                    ),
                                    items: List.generate(11, (index) => 2025 + index)
                                        .map((year) {
                                      return DropdownMenuItem<int>(
                                        value: year,
                                        child: Text(year.toString()),
                                      );
                                    }).toList(),
                                    onChanged: (value) {},
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ) ,
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

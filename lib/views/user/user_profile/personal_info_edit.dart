import 'package:b2w/core/extentions/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../../widget/app/app_buttons.dart';
import '../../../widget/app/app_text-field.dart';
import '../../../widget/app/app_text.dart';

class PersonalInfoEdit extends StatefulWidget {
  const PersonalInfoEdit({super.key});

  @override
  State<PersonalInfoEdit> createState() => _PersonalInfoEditState();
}

class _PersonalInfoEditState extends State<PersonalInfoEdit> {
  List<String> genderOptions = [
    'Male',
    'Female',

  ];
  String? selectedGender;
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
            "Edit your personal info",
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'Add img'.assetPNG,
                width: 100.w,
                height: 100.h,
              ),

            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText(title: 'First Name',color: AppColors.inputText,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      AppTextField(
                        hint: 'first name',

                        keyboardType: TextInputType.text,
                        width: 170.w,

                        validator: (value)
                        {
                          if (value!.isEmpty)
                          {
                            return 'Name must not be empty';

                          }
                          return null;

                        },

                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),

                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText(title: 'Last Name',color: AppColors.inputText,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      AppTextField(
                        hint: 'last name',
                      
                        keyboardType: TextInputType.text,
                        width: 170.w,
                        validator: (value)
                        {
                          if (value!.isEmpty)
                          {
                            return ' Name must not be empty';

                          }
                          return null;

                        },

                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(title: 'Job Title',color: AppColors.inputText,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            AppTextField
              (hint: 'Job title',
              keyboardType: TextInputType.text,
              validator: (value)
              {
                if (value!.isEmpty)
                {
                  return 'Job title must not be empty';

                }
                return null;

              },
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(title: 'Email Address',color: AppColors.inputText,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            AppTextField
              (hint: 'Example@gmail.com',

              keyboardType: TextInputType.emailAddress,
              validator: (value)
              {
                if (value!.isEmpty)
                {
                  return 'email must not be empty';

                }
                return null;

              },
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(title: 'Gender',color: AppColors.inputText,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  hintText: 'Gender',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),

                  fillColor: AppColors.grey

              ),
              value: selectedGender,
              items: genderOptions.map((job) {
                return DropdownMenuItem(
                  value: job,
                  child: Text(job),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),


            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(title: 'Bio',color: AppColors.inputText,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(10),

              ),
              child: TextField(
                maxLines: null,
                expands: true,
                decoration: InputDecoration(

                  hintText: 'type here ..',
                  helperStyle: TextStyle(
                    color: AppColors.grey,

                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12),
                ),

              ),
            ),
            SizedBox(
              height: 8.h,
            ),

            AppButton(title: 'Update',
              onTap: (){

              },
            ),
          ],
          ),
        ),
      ),
    );
  }
}

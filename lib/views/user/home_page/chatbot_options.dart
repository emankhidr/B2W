import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/views/user/home_page/chatbot_itself.dart';
import 'package:b2w/widget/app/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../../widget/app/app_text.dart';

class ChatbotOptions extends StatefulWidget {
  const ChatbotOptions({super.key});

  @override
  State<ChatbotOptions> createState() => _ChatbotOptionsState();
}

class _ChatbotOptionsState extends State<ChatbotOptions> {
  int selectedIndex = -1;
  bool choiceApplied = false;
  String? selectedJob;

  List<String> jobOptions = [
    'UI/UX Designer',
    'Sales',
    'Frontend Developer',
    'Product Manager',
    'Mechanical Engineer ',
    'Dentist'
  ];

  String getLevelText(int index) {
    switch (index) {
      case 0:
        return 'Easy';
      case 1:
        return 'Medium';
      case 2:
        return 'Hard';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
              size: 40,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(
          child: Text(
            "Chatbot Interview",
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
              AppText(
                title:
                'Select your preferences to get a tailored \n  interview experience.',
                color: AppColors.inputText,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(
                    title: 'Choose question Difficulty',
                    color: AppColors.inputText,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              SizedBox(height: 12.h),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                child: Container(
                  width: 358.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: selectedIndex == 0
                        ? const Color(0xFFDFA7A7).withOpacity(0.87)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: Colors.lightGreenAccent,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('easy'.assetPNG, width: 36.w, height: 36.h),
                        SizedBox(width: 8.w),
                        AppText(
                          title: 'Easy - Entry Level',
                          color: AppColors.inputText,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                child: Container(
                  width: 358.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: selectedIndex == 1
                        ? const Color(0xFFDFA7A7).withOpacity(0.87)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: Colors.orangeAccent,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('medium'.assetPNG,
                            width: 36.w, height: 36.h),
                        SizedBox(width: 8.w),
                        AppText(
                          title: 'Medium - Intermediate Level',
                          color: AppColors.inputText,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
                child: Container(
                  width: 358.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: selectedIndex == 2
                        ? const Color(0xFFDFA7A7).withOpacity(0.87)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: Colors.red,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('hard'.assetPNG, width: 36.w, height: 36.h),
                        SizedBox(width: 8.w),
                        AppText(
                          title: 'Hard - Senior Level',
                          color: AppColors.inputText,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              if (choiceApplied) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(title: 'Choose your field'),
                  ],
                ),
                SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Your Field',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    fillColor: AppColors.grey,
                  ),
                  value: selectedJob,
                  items: jobOptions.map((job) {
                    return DropdownMenuItem(
                      value: job,
                      child: Text(job),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedJob = value;
                    });
                  },
                ),
              ],
              SizedBox(height: 160.h),
              if (choiceApplied && selectedJob != null) ...[
                SizedBox(height: 24.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: AppText(
                    title:
                    "You are about to start a mock interview for '$selectedJob' at '${getLevelText(selectedIndex)}' level.\n\nThe interview will include 10 questions covering technical, problem-solving, and behavioral aspects.",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.inputText,
                  ),
                ),
              ],
              SizedBox(height: 24.h),
              choiceApplied
                  ? AppButton(
                title: 'Start chat',
                onTap: selectedJob != null
                    ? () {
                  print(
                      'Starting chat for $selectedJob at level $selectedIndex');
                  RouteUtils.push(
                    context,
                    ChatbotItself(
                      selectedField: selectedJob!,
                      selectedLevel: getLevelText(selectedIndex),
                    ),
                  );
                }
                    : null,
              )
                  : InkWell(
                onTap: selectedIndex != -1
                    ? () {
                  setState(() {
                    choiceApplied = true;
                  });
                }
                    : null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 358.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Center(
                      child: AppText(
                        title: 'Apply choice',
                        color: AppColors.darkGrey,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

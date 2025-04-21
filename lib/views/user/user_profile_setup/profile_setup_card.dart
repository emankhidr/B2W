
import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/core/utils/colors.dart';
import 'package:b2w/views/user/home_page/home_page_screen.dart';
import 'package:b2w/views/user/nav_bar/nav_bar.dart';
import 'package:b2w/widget/app/app-checkbox.dart';
import 'package:b2w/widget/app/app_buttons.dart';
import 'package:b2w/widget/app/app_text-field.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileSetup extends StatefulWidget {
  @override
  _ProfileSetupState createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int totalSteps = 7;
  final List<String> stepTitles = [
    "Personal Information",
    "Job Type",
    "Work Model",
    "Experience Level",
    "Job Title",
    "Accessbility Needs",
    "Accessbility Settings"
  ];
  List<String> genderOptions = [
    'Male',
    'Female',

  ];
  String? selectedGender;

  void _nextPage() {
    if (_currentPage < totalSteps - 1) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }



  PageController nextPage = PageController();
  int pageNumber = 0;
  String? _selectedSize = 'Small';
  bool isToggled = false;
  bool isToggled1 = false;
  bool isToggled2 = false;
  bool isToggled3 = false;
  List<bool> isSelectedList = [false, false, false, false,false,false,false,false,false];
  List<String> titles = ['Full-time', 'Part-time', 'Freelance', 'contract'];
  List<String> titles1 = ['On-site', 'Remote', 'Hybrid'];
  List<String> titles2 = ['Intern', 'Joiner', 'Mid-level','Senior', 'Lead',];
  List<String> titles3 = ['UI/UX designer', 'Marketing', 'Mid-Product Manager','Developer', 'Customer Support',
  'Quality Assurance','Data Analyst','Other'];
  List<String> titles4 = ['Physical Disabilities', 'Sensory Disabilities', 'Learning Disabilities','Neurological Disabilities', 'Developmental Disabilities',
  'Other'];





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30,
                    ),
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: CircularProgressIndicator(
                                value: (_currentPage + 1) / totalSteps,
                                backgroundColor: AppColors.grey,
                                valueColor: AlwaysStoppedAnimation(AppColors.primary),
                              ),
                            ),
                            Text(
                              "${_currentPage + 1}/$totalSteps",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Step ${_currentPage + 1}",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color:  AppColors.inputText)),
                            Text(stepTitles[_currentPage],
                                style: TextStyle(fontSize: 14, color:AppColors.inputText)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  _currentPage != 6
                      ? InkWell(
                    onTap: (){
                      setState(() {
                        _currentPage  = 6;
                        nextPage.animateToPage(6, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                      });
                    },
                    child: Text("Skip", style: TextStyle(color: AppColors.primary, fontSize: 16, decoration: TextDecoration.underline)),
                  ) : SizedBox(),

                ],
              ),
            ),
          ],
        ),
        toolbarHeight: 130,
      ),
      body: PageView(
        controller: nextPage ,
        onPageChanged: (value){
          setState(() {
            pageNumber = value;


          });
        },
        children: [
          //page 1
          Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
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
                        child: AppTextField(
                          hint: 'first name',
                          label: 'First Name',
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
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: AppTextField(
                          hint: 'last name',
                          label: 'Last Name',
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
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  AppTextField
                    (hint: 'Job title',
                    label: 'Job title ' ,
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
                  AppTextField
                    (hint: 'Example@gmail.com',
                    label: 'Email Address ' ,
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
                      AppText(title: 'Gender',
                      color: AppColors.inputText,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,),
                    ],
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
                     AppText(title: 'Bio',
                       color: AppColors.inputText,
                       fontWeight: FontWeight.w400,
                       fontSize: 24,),
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

                  AppButton(title: 'Next',
                    onTap: (){
                      nextPage.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                      _currentPage= 1;
                    },
                  ),
                ],
              ),
            ),
          ),
          // page 2
          Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      AppText(title: 'What Type of Job Are You\n         Interested In?',
                      color: AppColors.inputText,
                      fontSize: 21,
                      fontWeight:FontWeight.w700,
                      fontFamily: 'Lato',),

                     ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.start,

                   children: List.generate(4, (index){

                 return  Padding(
                   padding: EdgeInsets.only(
                     bottom: 8
                   ),
                   child: Container(
                   width: 358.w,
                   height: 48.h,
                   decoration: BoxDecoration(
                   color:AppColors.white,
                   borderRadius: BorderRadius.circular(15.r),
                   border: Border.all(
                   color: isSelectedList[index] ? AppColors.primary : AppColors.grey
                   )

                   ),
                   child: Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                   AppCheckBox(
                   isSelected: isSelectedList[index],
                   onTap: (){
                   setState(() {
                   isSelectedList[index] = !isSelectedList[index];
                   });
                   },
                   ),
                   SizedBox(
                   width: 10.w,
                   ),
                   AppText(title: titles[index],
                   fontSize: 16,
                   fontWeight: FontWeight.w400,
                   ),

                   ],
                   ),


                   ),

                       ),
                 );

                   }

                 ),



                 ),
                  SizedBox(
                    height: 215.h,
                  ),
                  AppButton(title: 'Next',
                    onTap: (){
                      nextPage.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                      _currentPage= 2;

                    },
                  ),

                  ],
              ),
            ),
          ),
          //page3
          Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      AppText(title: 'What is Your Level in of \n         Experience?',
                        color: AppColors.inputText,
                        fontSize: 21,
                        fontWeight:FontWeight.w700,
                        fontFamily: 'Lato',),

                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: List.generate(3, (index){

                      return  Padding(
                        padding: EdgeInsets.only(
                            bottom: 8
                        ),
                        child: Container(
                          width: 358.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                              color:AppColors.white,
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(
                                  color: isSelectedList[index] ? AppColors.primary : AppColors.grey
                              )

                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppCheckBox(
                                  isSelected: isSelectedList[index],
                                  onTap: (){
                                    setState(() {
                                      isSelectedList[index] = !isSelectedList[index];
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                AppText(title: titles1[index],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),

                              ],
                            ),


                          ),

                        ),
                      );

                    }

                    ),



                  ),
                  SizedBox(
                    height: 270.h,
                  ),
                  AppButton(title: 'Next',
                    onTap: (){
                      nextPage.animateToPage(3, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                      _currentPage= 3;

                    },
                  ),

                ],
              ),
            ),
          ),
          //page 4
          Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      AppText(title: 'What is Your Level in of\n      Experience?',
                        color: AppColors.inputText,
                        fontSize: 21,
                        fontWeight:FontWeight.w700,
                        fontFamily: 'Lato',),

                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: List.generate(5, (index){

                      return  Padding(
                        padding: EdgeInsets.only(
                            bottom: 8
                        ),
                        child: Container(
                          width: 358.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                              color:AppColors.white,
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(
                                  color: isSelectedList[index] ? AppColors.primary : AppColors.grey
                              )

                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppCheckBox(
                                  isSelected: isSelectedList[index],
                                  onTap: (){
                                    setState(() {
                                      isSelectedList[index] = !isSelectedList[index];
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                AppText(title: titles2[index],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),

                              ],
                            ),


                          ),

                        ),
                      );

                    }

                    ),



                  ),
                  SizedBox(
                    height: 160.h,
                  ),
                  AppButton(title: 'Next',
                    onTap: (){
                      nextPage.animateToPage(4, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                      _currentPage= 4;

                    },
                  ),

                ],
              ),
            ),
          ),
          //page 5
          Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      AppText(title: 'What Job Title Are You \n     Seeking?',
                        color: AppColors.inputText,
                        fontSize: 21,
                        fontWeight:FontWeight.w700,
                        fontFamily: 'Lato',),

                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: List.generate(8, (index){

                      return  Padding(
                        padding: EdgeInsets.only(
                            bottom: 8
                        ),
                        child: Container(
                          width: 358.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                              color:AppColors.white,
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(
                                  color: isSelectedList[index] ? AppColors.primary : AppColors.grey
                              )

                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppCheckBox(
                                  isSelected: isSelectedList[index],
                                  onTap: (){
                                    setState(() {
                                      isSelectedList[index] = !isSelectedList[index];
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                AppText(title: titles3[index],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),

                              ],
                            ),


                          ),

                        ),
                      );

                    }

                    ),



                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  AppButton(title: 'Next',
                    onTap: (){
                      nextPage.animateToPage(5, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                      _currentPage= 5;

                    },
                  ),

                ],
              ),
            ),
          ),
          //page 6
          Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      AppText(title: 'Select your type of disability to\npersonalize your experience and job\n    matches',
                        color: AppColors.inputText,
                        fontSize: 21,
                        fontWeight:FontWeight.w700,
                        fontFamily: 'Lato',),

                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: List.generate(6, (index){

                      return  Padding(
                        padding: EdgeInsets.only(
                            bottom: 8
                        ),
                        child: Container(
                          width: 358.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                              color:AppColors.white,
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(
                                  color: isSelectedList[index] ? AppColors.primary : AppColors.grey
                              )

                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppCheckBox(
                                  isSelected: isSelectedList[index],
                                  onTap: (){
                                    setState(() {
                                      isSelectedList[index] = !isSelectedList[index];
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                AppText(title: titles4[index],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),

                              ],
                            ),


                          ),

                        ),
                      );

                    }

                    ),



                  ),
                  SizedBox(
                    height: 85.h,
                  ),
                  AppButton(title: 'Next',
                    onTap: (){
                      nextPage.animateToPage(6, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                      _currentPage= 6;

                    },
                  ),

                ],
              ),
            ),
          ),
          //page 7
          Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 28.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('font 1'.assetPNG,
                      width: 20.w,
                      height: 20.h,),
                      SizedBox(
                        width: 4.w,
                      ),
                      AppText(title: 'Fonts',
                      color: AppColors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,)

                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     AppText(title: 'FontSize',
                       color: AppColors.black,
                       fontWeight: FontWeight.w400,
                       fontSize: 16,),
                     SizedBox(
                       height: 4.h,
                     ),
                   ],
                 ),

    Row(
      mainAxisAlignment: MainAxisAlignment.start, // Centers the buttons
      children: [
        Row(
          children: [
            Radio<String>(
              value: 'Small',
              groupValue: _selectedSize,
              onChanged: (String? value) {
                setState(() {
                  _selectedSize = value;
                });
              },
              activeColor: AppColors.primary,
            ),
            Text('Small'),
          ],
        ),
        SizedBox(width: 38.w), // Space between radio buttons
        Row(
          children: [
            Radio<String>(
              value: 'Medium',
              groupValue: _selectedSize,
              onChanged: (String? value) {
                setState(() {
                  _selectedSize = value;
                });
              },
              activeColor: AppColors.primary,
            ),
            Text('Medium'),
          ],
        ),
        SizedBox(width: 38.w), // Space between radio buttons
        Row(
          children: [
            Radio<String>(
              value: 'Large',
              groupValue: _selectedSize,
              onChanged: (String? value) {
                setState(() {
                  _selectedSize = value;
                });
              },
              activeColor:AppColors.primary,
            ),
            Text('Large'),
          ],
        ),
      ],
    ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      AppText(title: 'Line Hight',color: AppColors.black
                        ,fontSize: 16,
                          fontWeight: FontWeight.w400,),
                      Spacer(),
              Switch(
                value: isToggled,
                onChanged: (bool value) {
                  setState(() {
                    isToggled = value; // Toggle state
                  });
                },
                activeColor: AppColors.white,
                activeTrackColor: AppColors.primary,
                inactiveThumbColor: AppColors.primary,
                inactiveTrackColor: AppColors.lightGrey,
              ),



                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      AppText(title: 'Word Spacing',color: AppColors.black
                        ,fontSize: 16,
                        fontWeight: FontWeight.w400,),
                      Spacer(),
                      Switch(
                        value: isToggled1,
                        onChanged: (bool value) {
                          setState(() {
                            isToggled1 = value; // Toggle state
                          });
                        },
                        activeColor: AppColors.white,
                        activeTrackColor: AppColors.primary,
                        inactiveThumbColor: AppColors.primary,
                        inactiveTrackColor: AppColors.lightGrey,

                      ),

                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('color'.assetPNG,
                        width: 20.w,
                        height: 20.h,),
                      SizedBox(
                        width: 4.w,
                      ),
                      AppText(title: 'Colors',
                        color: AppColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,)

                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      AppText(title: 'Contrast Mode',color: AppColors.black
                        ,fontSize: 16,
                        fontWeight: FontWeight.w400,),
                      Spacer(),
                      Switch(
                        value: isToggled2,
                        onChanged: (bool value) {
                          setState(() {
                            isToggled2 = value; // Toggle state
                          });
                        },
                        activeColor: AppColors.white,
                        activeTrackColor: AppColors.primary,
                        inactiveThumbColor: AppColors.primary,
                        inactiveTrackColor: AppColors.lightGrey,

                      ),

                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      AppText(title: 'Dark Mode',color: AppColors.black
                        ,fontSize: 16,
                        fontWeight: FontWeight.w400,),
                      Spacer(),
                      Switch(
                        value: isToggled3,
                        onChanged: (bool value) {
                          setState(() {
                            isToggled3 = value; // Toggle state
                          });
                        },
                        activeColor: AppColors.white,
                        activeTrackColor: AppColors.primary,
                        inactiveThumbColor: AppColors.primary,
                        inactiveTrackColor: AppColors.lightGrey,

                      ),

                    ],
                  ),
                  SizedBox(
                    height: 190.h,
                  ),
                  AppButton(title: 'Save and Start',
                  onTap: (){
                    RouteUtils.push(context,NavBarScreen());
                  },)


             ], ),
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/views/user/job_screen/search_job%202.dart';
import 'package:b2w/widget/app/app_buttons.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../../widget/app/custom_track_shape.dart';

class FilterJob extends StatefulWidget {
  const FilterJob({super.key});

  @override
  State<FilterJob> createState() => _FilterJobState();
}

class _FilterJobState extends State<FilterJob> {
  RangeValues _currentRange = const RangeValues(30 , 50);
  final int minValue = 10;
  final int maxValue = 70;
  final int divisions = 7;
  String? selectedOption;
  String? selectedOption1;// Null means no value selected yet

  final List<String> options = [
    'Option 1',
    'Option 2',
    'Option 3',
    // Add more as needed
  ];
  final List<String> options1 = [
    'Option1',
    'Option2',
    'Option3',
    // Add more as needed
  ];// 🔧 Change this to make it dynamic

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(Icons.arrow_back_ios, color: AppColors.black, size: 40,),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(
          child: Text(
            "Filter Jobs",
            style: TextStyle(color: AppColors.black,
                fontSize: 25,
                fontWeight: FontWeight.w400,
                fontFamily: 'Lato'),
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
                  AppText(title: 'Jop title',color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 21,)
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              SizedBox(
                height: 8.h,
              ),
              DropdownButtonFormField<String>(
                value: selectedOption1,
                decoration: InputDecoration(
                  labelText: "Job title",
                  filled: true,
                  fillColor: Colors.white,

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide(color: AppColors.grey),
                  ),
                  labelStyle: TextStyle(color: AppColors.grey),
                ),
                dropdownColor: AppColors.grey,
                style: TextStyle(color: AppColors.grey),
                iconEnabledColor: AppColors.grey,
                items: options1.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOption1 = newValue;
                  });
                },
                validator: (value) => value == null ? 'Please select an option' : null,
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(title: 'Jop type',color: AppColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 21,)
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  Chip(
                    label: Text("All"),

                    labelStyle: const TextStyle(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                    label: Text("Part-time"),

                    labelStyle: const TextStyle(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                    label: Text("Full-time"),

                    labelStyle: const TextStyle(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),


                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(title: 'Working model',color: AppColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 21,)
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  Chip(
                    label: Text("All"),

                    labelStyle: const TextStyle(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                    label: Text("On-site"),
                    labelStyle: const TextStyle(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                    label: Text("Remote"),

                    labelStyle: const TextStyle(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                    label: Text("Full-time"),

                    labelStyle: const TextStyle(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),


                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(title: 'Level of experience',color: AppColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 21,)
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  Chip(
                    label: Text("Intern"),

                    labelStyle: const TextStyle(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                    label: Text("Mid-level"),
                    labelStyle: const TextStyle(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                    label: Text("Joiner"),

                    labelStyle: const TextStyle(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                    label: Text("Senior"),

                    labelStyle: const TextStyle(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),


                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(title: 'Salary',color: AppColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 21,)
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 8.0,
                  activeTrackColor: AppColors.primary,
                  inactiveTrackColor: AppColors.lightPrimary,
                  thumbColor: Colors.white,
                  overlayColor: AppColors.lightPrimary,
                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                  rangeTrackShape: CustomTrackShape(),
                ),
                child: RangeSlider(
                  values: _currentRange,
                  min: minValue.toDouble(),
                  max: maxValue.toDouble(),
                  divisions: divisions - 1,
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRange = values;
                    });
                  },
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(divisions, (index) {
                  final value = minValue + ((maxValue - minValue) ~/ (divisions - 1)) * index;
                  final label = (index == divisions - 1) ? '${value}k+' : '${value}k';
                  return Text(
                    value.toString(),
                    style: TextStyle(color: AppColors.black, fontSize: 12, fontWeight: FontWeight.w500), // Match your theme
                  );
                }),
              ),
              SizedBox(
                height:16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(title: 'Location',color: AppColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 21,)
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              DropdownButtonFormField<String>(
                value: selectedOption,
                decoration: InputDecoration(
                  labelText: "Location",
                  filled: true,
                  fillColor: Colors.white,

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide(color: AppColors.grey),
                  ),
                  labelStyle: TextStyle(color: AppColors.grey),
                ),
                dropdownColor: AppColors.grey,
                style: TextStyle(color: AppColors.grey),
                iconEnabledColor: AppColors.grey,
                items: options.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOption = newValue;
                  });
                },
                validator: (value) => value == null ? 'Please select an option' : null,
              ),
              SizedBox(
                height: 24,
              ),

              AppButton(title: 'Filter',onTap: (){
                RouteUtils.push(context, SearchJob2());
              },)

            ],
          ),
        ),
      ),
    );
  }
}

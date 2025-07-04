 import 'package:b2w/core/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_widgets/custom_appbar_widget.dart';
import '../../../../core/shared_widgets/custom_buttom.dart';
 import '../../../../core/styles/text_styles.dart';

  import '../../../../core/utils/sizes.dart';
import '../../data/models/job_details_model.dart';
import '../bloc/upload_job_cubit.dart';
import '../bloc/upload_job_state.dart';
import '../widgets/custom_txt_field_spec_widget.dart';
import '../widgets/custom_txt_field_widget.dart';
import 'job_details_page.dart';


class PostJobPage extends StatefulWidget {
  const PostJobPage({super.key});

  @override
  State<PostJobPage> createState() => _PostJobPageState();
}

class _PostJobPageState extends State<PostJobPage> {
  List<String>jobLevel=["Senior","Junior","Mid_Level","Fresh"];
  List<String>jobType=["Part_Time","Full_time", ];
  List<String>workModel=["onSite","remotely", ];
  List<String>currency=["1","2",'3' ];

  final List<String> countryCodes = [
    "+1",    // أمريكا وكندا
    "+20",   // مصر
    "+966",  // السعودية
    "+971",  // الإمارات
    "+965",  // الكويت
    "+974",  // قطر
    "+973",  // البحرين
    "+968",  // عُمان
    "+967",  // اليمن
    "+961",  // لبنان
    "+963",  // سوريا
    "+964",  // العراق
    "+962",  // الأردن
    "+213",  // الجزائر
    "+212",  // المغرب
    "+216",  // تونس
    "+218",  // ليبيا
    "+249",  // السودان
    "+90",   // تركيا
    "+44",   // بريطانيا
    "+33",   // فرنسا
    "+49",   // ألمانيا
    "+86",   // الصين
    "+91",   // الهند
    "+81",   // اليابان
    "+7",    // روسيا
  ];
   @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PostJobCubit(),
        child: BlocConsumer<PostJobCubit, PostJobState>(
            listener: (context, state) {
              if (state is PostJobSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Job Posted Successfully ✅")),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JobDetailsScreen(
                      jobDetails: state.jobDetails,
                    ),
                  ),
                );

              } else if (state is PostJobFailure) {

              }
            }, builder: (context, state) {
          final cubit = context.read<PostJobCubit>();
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: appBarContent(title: 'Post Job', context: context),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("1. Quick Job Overview",
                         style: StyleManger.almostBlack20w700()
                      ),
                      spaceHeight(15),
                      Text("Job Title"),
                      customTextField(
                        hintText: 'EX : Product manager',
                        prefixIconData: Icons.add,
                        controller: cubit.jobTitleController,
                        reload: (fn) {},
                        onPressedSuffix: () {},
                        enumData: fieldsType.jobTitle,
                        prefixIconOnPressed: () {},
                      ),
                      Text("Job Level"),
                      customTextField(dropdownItems: jobLevel,
                        hintText: 'Select one',
                        prefixIconData: Icons.add,
                        controller: cubit.jobLevelController,
                        reload: (fn) {},
                        onPressedSuffix: () {},
                        enumData: fieldsType.jobLevel,
                        prefixIconOnPressed: () {},
                      ),
                      Text("Job Type"),
                      customTextField(dropdownItems: jobType,
                        hintText: 'EX : Product manager',
                        prefixIconData: Icons.add,
                        controller: cubit.jobTypeController,
                        reload: (fn) {},
                        onPressedSuffix: () {},
                        enumData: fieldsType.jobType,
                        prefixIconOnPressed: () {},
                      ),
                      Text("Working Model"),
                      customTextField(
                        dropdownItems: workModel,
                        hintText: 'اختر نموذج العمل',
                        prefixIconData: Icons.work_outline,
                        controller: cubit.workingModelController,
                        reload: (fn) {},
                        onPressedSuffix: () {},
                        prefixIconOnPressed: () {},
                        enumData: fieldsType.workingModel,
                      ),
                      spaceHeight(15),
                      Text("Currency"),
                      customTextField(dropdownItems: currency,
                        hintText: 'EGY',
                        controller: cubit.currencyController,
                        reload: (fn) {},
                        onPressedSuffix: () {},
                        enumData: fieldsType.currency,
                        prefixIconOnPressed: () {},
                        prefixIconData: Icons.add,
                      ),
                      spaceHeight(10),
                      Text("Salary Range"),
                      spaceHeight(3),
                      RangeSlider(
                        values: cubit.currentRangeValues,
                        min: 10,
                        max: 70,
                        divisions: 6,
                        activeColor: AppColors.primary,
                        inactiveColor: Colors.purple.shade100,
                        onChanged: (RangeValues values) {
                          setState(() {
                            cubit.currentRangeValues = values;
                          });
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("10k", style: TextStyle(color: Colors.grey)),
                          Text("20k", style: TextStyle(color: Colors.grey)),
                          Text("30k", style: TextStyle(color: Colors.grey)),
                          Text("40k", style: TextStyle(color: Colors.grey)),
                          Text("50k", style: TextStyle(color: Colors.grey)),
                          Text("60k", style: TextStyle(color: Colors.grey)),
                          Text("70k+", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      spaceHeight(15),
                      Text("2. Job Specifications",
                          style: StyleManger.almostBlack20w700()
                      ),
                      spaceHeight(15),
                      Text("Job Description"),
                      descriptionTextField(
                        controller: cubit.descriptionController,
                        hintText: 'Description',
                        label: '',
                      ),
                      spaceHeight(5),
                      Text("Job Requirement"),
                      descriptionTextField(
                        controller: cubit.requirementController,
                        hintText: 'Requirement',
                        label: '',
                      ),
                      spaceHeight(5),
                      Text("About Company"),
                      descriptionTextField(
                        controller: cubit.aboutCompanyController,
                        hintText: 'About Company',
                        label: '',
                      ),
                      spaceHeight(5),
                      Text("Contact Us", style: TextStyle(fontSize: 25)),
                      Text("Person Name"),
                      customTextField(
                        hintText: 'Person Name',
                        prefixIconData: Icons.add,
                        controller: cubit.personNameController,
                        reload: (fn) {},
                        onPressedSuffix: () {},
                        enumData: fieldsType.personName,
                        prefixIconOnPressed: () {},
                      ),
                      spaceHeight(5),
                      Text("Phone Number"),
                      customTextField(dropdownItems: countryCodes,
                        hintText: 'EGY',
                        controller: cubit.phoneNumberController,
                        reload: (fn) {},
                        onPressedSuffix: () {},
                        enumData: fieldsType.phoneNumber,
                        prefixIconOnPressed: () {},
                        prefixIconData: Icons.add,
                      ),
                      spaceHeight(10),
                      customButtom(
                        title: 'Post',
                        onTap: () {
                          if (cubit.formKey.currentState!.validate()) {
                            final jobDetails = JobDetails(
                              jobTitle: cubit.jobTitleController.text,
                              jobLevel: cubit.jobLevelController.text,
                              jobType: cubit.jobTypeController.text,
                              workingModel: cubit.workingModelController.text,
                              currency: cubit.currencyController.text,
                              salaryRange: cubit.currentRangeValues,
                              description: cubit.descriptionController.text,
                              requirements: cubit.requirementController.text,
                              aboutCompany: cubit.aboutCompanyController.text,
                            );
                            cubit.postJob(jobDetails);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}

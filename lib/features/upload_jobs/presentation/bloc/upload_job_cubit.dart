 import 'package:b2w/features/upload_jobs/presentation/bloc/upload_job_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/job_details_model.dart';



class PostJobCubit extends Cubit<PostJobState> {
  PostJobCubit() : super(PostJobInitial());

  final formKey = GlobalKey<FormState>();
  String selectedCurrency = "EGP";

  TextEditingController jobTitleController = TextEditingController();
  TextEditingController jobLevelController = TextEditingController();
  TextEditingController jobTypeController = TextEditingController();
  TextEditingController workingModelController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController requirementController = TextEditingController();
  TextEditingController aboutCompanyController = TextEditingController();
  TextEditingController personNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  RangeValues currentRangeValues = RangeValues(30, 50);

  void updateSalaryRange(RangeValues values) {
    currentRangeValues = values;
    emit(PostJobUpdated());
  }

  void postJob(JobDetails jobDetails) {
    if (formKey.currentState!.validate()) {
      emit(PostJobSuccess(jobDetails)); // تمرير بيانات الوظيفة
    } else {
      emit(PostJobFailure("Please fill in all required fields."));
    }
  }
}

import 'package:flutter/material.dart';

class JobDetails {
  final String jobTitle;
  final String jobLevel;
  final String jobType;
  final String workingModel;
  final String currency;
  final RangeValues salaryRange;
  final String description;
  final String requirements;
  final String aboutCompany;

  JobDetails({
    required this.jobTitle,
    required this.jobLevel,
    required this.jobType,
    required this.workingModel,
    required this.currency,
    required this.salaryRange,
    required this.description,
    required this.requirements,
    required this.aboutCompany,
  });
}

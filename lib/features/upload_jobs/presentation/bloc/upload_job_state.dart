import 'package:meta/meta.dart';

import '../../data/models/job_details_model.dart';


@immutable
abstract class PostJobState {}

class PostJobInitial extends PostJobState {}

class PostJobUpdated extends PostJobState {}

class PostJobSuccess extends PostJobState {
  final JobDetails jobDetails; // إضافة الخاصية

  PostJobSuccess(this.jobDetails);
}
class PostJobFailure extends PostJobState {
  final String message;
  PostJobFailure(this.message);
}

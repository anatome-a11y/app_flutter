import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';

abstract class ExamState {}

class ExamEmptyState implements ExamState {}

class ExamContentState implements ExamState {
  final Exam exam;
  final bool examFinished;

  ExamContentState({required this.exam, required this.examFinished});
}

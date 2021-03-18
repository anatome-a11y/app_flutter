import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';

abstract class ScriptHomeState {}

class ScriptHomeEmptyState implements ScriptHomeState {}

class ScriptHomeExamState implements ScriptHomeState {
  final Exam exam;

  ScriptHomeExamState(this.exam);
}

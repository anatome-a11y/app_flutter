import 'package:flutter_test/flutter_test.dart';
import 'package:app_flutter/app/modules/roteiros/infra/repositories/exam_repository.dart';
 
void main() {
  late ExamRepository repository;

  setUpAll(() {
    repository = ExamRepository();
  });
}
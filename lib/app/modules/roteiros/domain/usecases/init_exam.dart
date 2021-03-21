import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_type.dart';
import 'package:app_flutter/app/modules/roteiros/domain/repositories/exam_repository_interface.dart';
import 'package:dartz/dartz.dart';

abstract class IInitExam {
  Future<Either<Exception, Exam>> call();
}

class InitExam extends IInitExam {
  final IExamRepository repository;

  InitExam(this.repository);

  @override
  Future<Either<Exception, Exam>> call() async {
    return repository.getExam();
  }
}

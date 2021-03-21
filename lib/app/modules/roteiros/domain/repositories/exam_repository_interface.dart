import '../entities/exam.dart';
import 'package:dartz/dartz.dart';

abstract class IExamRepository {
  Future<Either<Exception, Exam>> getExam();
}

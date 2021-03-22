import 'package:app_flutter/app/modules/roteiros/domain/entities/anatomy_piece.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:app_flutter/app/modules/roteiros/infra/repositories/questions/question_1.dart';

import '../../domain/repositories/exam_repository_interface.dart';
import 'package:dartz/dartz.dart';

class ExamRepository implements IExamRepository {
  final AnatomyPiece cranio = AnatomyPiece(name: 'Crânio');

  final List<String> theoreticalContents = [
    'Osso par, irregular e pneumático. Articula-se com o nasal, palatino, etmoide, frontal, zigomático, lacrimal, vômer e concha nasal inferior.',
    'Osso par, irregular, que forma a lateral inferior da fossa nasal, paralelamente ao vômer e com formato de gancho.',
    'Osso ímpar, laminar, localizado acima da região da boca e abaixo do nariz.'
  ];

  Future<Either<Exception, Exam>> getExam() async {
    final exam = Exam(questions: [
      Question1.get(cranio, theoreticalContents),
    ]);

    await Future.delayed(Duration(seconds: 2));

    return optionOf(exam).fold(
      () => Left(Exception()),
      (exam) => right(exam),
    );
  }
}

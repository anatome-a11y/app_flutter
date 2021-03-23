import 'package:app_flutter/app/modules/roteiros/domain/entities/anatomy_piece.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:app_flutter/app/modules/roteiros/infra/repositories/questions/question_1.dart';
import 'package:app_flutter/app/modules/roteiros/infra/repositories/questions/question_2.dart';

import '../../domain/repositories/exam_repository_interface.dart';
import 'package:dartz/dartz.dart';

class ExamRepository implements IExamRepository {
  final AnatomyPiece cranio = AnatomyPiece(name: 'Crânio');

  final List<String> theoreticalContents = [
    'Formam a calota craniana',
  ];

  Future<Either<Exception, Exam>> getExam() async {
    final exam = Exam(
      questions: [
        Question1.get(cranio, theoreticalContents),
        Question2.get(cranio, theoreticalContents),
        for (int i = 0; i < 9; i++) Question1.get(cranio, theoreticalContents)
      ],
    );

    await Future.delayed(Duration(milliseconds: 300));

    return optionOf(exam).fold(
      () => Left(Exception()),
      (exam) => right(exam),
    );
  }
}

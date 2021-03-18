import 'package:app_flutter/app/modules/roteiros/domain/entities/anatomy_part.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/anatomy_part_relation.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/anatomy_piece.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_type.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/question.dart';
import 'package:dartz/dartz.dart';

abstract class IInitExam {
  Future<Either<Exception, Exam>> call();
}

class InitExam extends IInitExam {
  final AnatomyPiece cranio = AnatomyPiece(name: 'Crânio');

  final String theoreticalContent1 =
      'Osso par, irregular e pneumático. Articula-se com o nasal, palatino, etmoide, frontal, zigomático, lacrimal, vômer e concha nasal inferior.';

  final String theoreticalContent2 =
      'Osso par, irregular, que forma a lateral inferior da fossa nasal, paralelamente ao vômer e com formato de gancho.';

  final String theoreticalContent3 =
      'Osso ímpar, laminar, localizado acima da região da boca e abaixo do nariz.';

  @override
  Future<Either<Exception, Exam>> call() async {
    final exam = Exam(
      message: 'Dada a localização....',
      questions: [
        getQuestion1(),
      ],
      type: ExamType.THEORETICAL_NAME,
    );

    return optionOf(exam).fold(
      () => Left(Exception()),
      (exam) => right(exam),
    );
  }

  Question getQuestion1() {
    return Question(
      part: AnatomyPart(
        piece: cranio,
        number: 9,
        name: 'Maxila',
        theoreticalContent: [
          theoreticalContent1,
        ],
        partRelations: [
          AnatomyPartRelation(
            relatedPart: AnatomyPart(
              piece: cranio,
              number: 9,
              name: 'Concha Nasal Inferior (2)',
              partRelations: [],
              theoreticalContent: [
                theoreticalContent2,
              ],
            ),
            relationDescription1:
                'medialmente a ela e lateralmente ao septo nasal.',
            relationDescription2: 'lateralmente a ela, externamente, na face',
          ),
          AnatomyPartRelation(
            relatedPart: AnatomyPart(
              piece: cranio,
              number: 9,
              name: 'Vomer',
              partRelations: [],
              theoreticalContent: [theoreticalContent3],
            ),
            relationDescription1:
                'exatamente no ponto mediano entre esses dois ossos, dentro da cavidade nasal, contribuindo para a formação do septo nasal.',
            relationDescription2: 'lateralmente a ela, externamente, na face.',
          ),
        ],
      ),
    );
  }
}

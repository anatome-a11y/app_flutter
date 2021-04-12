import 'package:app_flutter/app/modules/roteiros/domain/entities/anatomy_part.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/anatomy_part_relation.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/anatomy_piece.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/question.dart';

abstract class Question3 {
  static Question get(AnatomyPiece piece, List<String> theoreticalContents) {
    return Question(
      part: AnatomyPart(
        piece: piece,
        number: 1,
        name: 'Occipital',
        theoreticalContent: [
          'Osso ímpar, classificado como laminar e pneumático, tem um aspecto arredondado, localizado na região anterosuperior do crânio.',
          'É um dos ossos que formam a calota craniana.'
        ],
        partRelations: [],
      ),
    );
  }
}

import 'package:app_flutter/app/modules/roteiros/domain/entities/anatomy_part.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/anatomy_part_relation.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/anatomy_piece.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/question.dart';

abstract class Question1 {
  static Question get(AnatomyPiece piece, List<String> theoreticalContents) {
    return Question(
      part: AnatomyPart(
        piece: piece,
        number: 9,
        name: 'Maxila',
        theoreticalContent: [
          theoreticalContents[0],
        ],
        partRelations: [
          AnatomyPartRelation(
            relatedPart: AnatomyPart(
              piece: piece,
              number: 9,
              name: 'Concha Nasal Inferior (2)',
              partRelations: [],
              theoreticalContent: [
                theoreticalContents[1],
              ],
            ),
            relationDescription1:
                'medialmente a ela e lateralmente ao septo nasal.',
            relationDescription2: 'lateralmente a ela, externamente, na face',
          ),
          AnatomyPartRelation(
            relatedPart: AnatomyPart(
              piece: piece,
              number: 9,
              name: 'Vomer',
              partRelations: [],
              theoreticalContent: [
                theoreticalContents[2],
              ],
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

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
          'Osso par, irregular e pneumático. Articula-se com o nasal, palatino, etmoide, frontal, zigomático, lacrimal, vômer e concha nasal inferior.',
          'Suportam os dentes superiores e forma uma parte do palato, da cavidade nasal e da órbita ocular.'
        ],
        partRelations: [
          AnatomyPartRelation(
            relatedPart: AnatomyPart(
              piece: piece,
              number: 9,
              name: 'Concha Nasal Inferior (2)',
              partRelations: [],
              theoreticalContent: [
                'Osso par, irregular, que forma a lateral inferior da fossa nasal, paralelamente ao vômer e com formato de gancho.',
                'Localizado inferiormente à concha nasal média do osso etmoide. Articula-se com o etmoide, maxilar, lacrimal e palatino.'
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
                'Osso ímpar, laminar, localizado acima da região da boca e abaixo do nariz.',
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

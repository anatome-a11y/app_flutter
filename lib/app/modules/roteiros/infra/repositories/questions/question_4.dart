import 'package:app_flutter/app/modules/roteiros/domain/entities/anatomy_part.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/anatomy_part_relation.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/anatomy_piece.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/question.dart';

abstract class Question4 {
  static Question get(AnatomyPiece piece, List<String> theoreticalContents) {
    return Question(
      part: AnatomyPart(
        piece: piece,
        number: 8,
        name: 'Zigomático',
        theoreticalContent: [
          'Osso par, irregular. Localiza-se na região da bochecha e é o mais proeminente da face.',
        ],
        partRelations: [],
      ),
    );
  }
}

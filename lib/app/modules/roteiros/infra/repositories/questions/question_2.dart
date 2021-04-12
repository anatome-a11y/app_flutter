import 'package:app_flutter/app/modules/roteiros/domain/entities/anatomy_part.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/anatomy_part_relation.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/anatomy_piece.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/question.dart';

abstract class Question2 {
  static Question get(AnatomyPiece piece, List<String> theoreticalContents) {
    return Question(
      part: AnatomyPart(
        piece: piece,
        number: 5,
        name: 'Etmoide',
        theoreticalContent: [
          'Osso ímpar, irregular e pneumático, leve e esponjoso. Sua altura, comprimento e largura se equivalem harmoniosamente, não havendo predomínio significativo de nenhuma destas dimensões. Este osso localiza-se na base do crânio, mais concretamente, na zona anterior medial.',
          'Possui diversos clivos (orifícios) e canais olfativos, por onde passam estruturas importantes para a percepção olfativa. '
        ],
        partRelations: [],
      ),
    );
  }
}

import 'anatomy_part_relation.dart';
import 'anatomy_piece.dart';

class AnatomyPart {
  final AnatomyPiece piece;
  final int number;
  final String name;
  final List<String> theoreticalContent;

  final List<AnatomyPartRelation> partRelations;

  AnatomyPart({
    required this.piece,
    required this.number,
    required this.name,
    required this.theoreticalContent,
    required this.partRelations,
  });
}

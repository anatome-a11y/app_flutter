import 'exam_type.dart';
import 'question.dart';

class Exam {
  final String message;
  final List<Question> questions;
  final ExamType type;

  Exam({required this.message, required this.questions, required this.type});
}

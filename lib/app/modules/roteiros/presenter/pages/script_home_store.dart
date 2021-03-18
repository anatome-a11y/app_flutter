import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_type.dart';
import 'package:app_flutter/app/modules/roteiros/domain/usecases/init_exam.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class ScriptHomeStore extends NotifierStore<Exception, Exam> {
  ScriptHomeStore()
      : super(Exam(
          message: '',
          questions: [],
          type: ExamType.PRACTICAL_LOCATE,
        ));

  initExam() {
    final IInitExam initExam = Modular.get<IInitExam>();

    initExam().then((value) {
      print('\n\n\n Resultado:\n\n');

      value.fold((l) => {}, (exam) {
        update(exam);
      });
    });
  }

  refresh() {
    setLoading(true);
    // await Future.delayed(Duration(milliseconds: 200));
    setLoading(false);
  }
}

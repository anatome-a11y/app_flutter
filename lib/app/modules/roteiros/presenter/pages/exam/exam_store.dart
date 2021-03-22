import 'package:app_flutter/app/modules/roteiros/domain/usecases/init_exam.dart';
import 'package:app_flutter/app/modules/roteiros/presenter/pages/exam/exam_state.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class ExamStore extends NotifierStore<Exception, ExamState> {
  ExamStore() : super(ExamEmptyState());

  final IInitExam initExam = Modular.get<IInitExam>();

  setExam() async {
    await executeEither(
      () => initExam().then(
        (value) => value.map(
          (value) => ExamContentState(value),
        ),
      ),
    );
  }
}

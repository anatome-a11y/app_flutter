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
          (value) => ExamContentState(
            exam: value,
            examFinished: false,
            examInitied: false,
          ),
        ),
      ),
    );
  }

  void setExamAsInitied() {
    final _state = state as ExamContentState;
    update(
      ExamContentState(
          exam: _state.exam,
          examFinished: _state.examFinished,
          examInitied: true),
    );
  }

  void setExamAsFinished() {
    final _state = state as ExamContentState;

    update(
      ExamContentState(
        exam: _state.exam,
        examFinished: true,
        examInitied: _state.examInitied,
      ),
    );
  }
}

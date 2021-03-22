import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_mode.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'script_home_states.dart';

class ScriptHomeStore extends NotifierStore<Exception, ScriptHomeState> {
  ScriptHomeStore() : super(ScriptHomeState());

  initExam(ExamMode mode) async {
    final String contentType = mode.isTheoretical ? 'theoretical' : 'practical';
    final String answerMode = mode.isToFind ? 'find' : 'name';

    Modular.to.pushNamed(
      'exam/$contentType/$answerMode',
    );
  }
}

import 'package:app_flutter/app/modules/roteiros/domain/usecases/init_exam.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'script_home_states.dart';

class ScriptHomeStore extends NotifierStore<Exception, ScriptHomeState> {
  ScriptHomeStore() : super(ScriptHomeEmptyState());

  initExam(isTeorico, isLocalizar) async {
    print('init exam $isTeorico $isLocalizar');

    Modular.to.pushNamed('exam');
    // final IInitExam initExam = Modular.get<IInitExam>();

    // setLoading(true);

    // await Future.delayed(Duration(seconds: 2));
    // final value = await initExam();

    // value.fold(
    //   (l) => {},
    //   (exam) {
    //     update(ScriptHomeExamState(exam));
    //   },
    // );

    // setLoading(false);
  }
}

import 'package:app_flutter/app/modules/roteiros/infra/repositories/exam_repository.dart';
import 'package:app_flutter/app/modules/roteiros/presenter/pages/exam/exam_store.dart';
import 'package:app_flutter/app/modules/roteiros/presenter/pages/exam/exam_page.dart';
import 'package:app_flutter/app/modules/roteiros/domain/usecases/init_exam.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/entities/exam_mode.dart';
import 'presenter/pages/script_home/script_home_page.dart';
import 'presenter/pages/script_home/script_home_store.dart';

class RoteirosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ExamRepository()),
    Bind.lazySingleton((i) => ExamStore()),
    Bind.lazySingleton((i) => ScriptHomeStore()),
    Bind.lazySingleton((i) => InitExam(i.get<ExamRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => ScriptHomePage()),
    ChildRoute(
      '/exam/:contentType/:answerMode',
      child: (_, args) => ExamPage(
        mode: ExamMode(
          isTheoretical: args.params['contentType'] == 'theoretical',
          isToFind: args.params['answerMode'] == 'find',
        ),
      ),
    ),
  ];

  static popUntilScriptsHomePage() {
    Modular.to.popUntil((route) {
      final name = route.settings.name;
      return name == '/scripts/';
    });
  }
}

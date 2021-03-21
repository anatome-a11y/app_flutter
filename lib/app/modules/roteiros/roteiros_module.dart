import 'package:app_flutter/app/modules/roteiros/presenter/pages/exam/exam_store.dart';
import 'package:app_flutter/app/modules/roteiros/presenter/pages/exam/exam_page.dart';
import 'package:app_flutter/app/modules/roteiros/domain/usecases/init_exam.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/script_home/script_home_page.dart';
import 'presenter/pages/script_home/script_home_store.dart';

class RoteirosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ExamStore()),
    Bind.lazySingleton((i) => ExamStore()),
    Bind.lazySingleton((i) => ScriptHomeStore()),
    Bind.lazySingleton((i) => InitExam()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => ScriptHomePage()),
    ChildRoute('/exam', child: (_, args) => ExamPage()),
  ];
}

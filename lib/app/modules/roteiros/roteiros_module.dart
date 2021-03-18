import 'package:app_flutter/app/modules/roteiros/domain/usecases/init_exam.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class RoteirosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => InitExam()),
  ];

  @override
  final List<ModularRoute> routes = [];
}

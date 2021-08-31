import 'package:app_flutter/app/modules/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<Settings>(Settings());

  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

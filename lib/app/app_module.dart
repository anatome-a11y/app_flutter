import 'package:flutter_modular/flutter_modular.dart';

import 'app_store.dart';
import 'modules/home/home_module.dart';
import 'modules/roteiros/roteiros_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => AppStore(),
    )
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute('/scripts', module: RoteirosModule()),
  ];
}

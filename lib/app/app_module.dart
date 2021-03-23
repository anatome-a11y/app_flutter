import 'package:flutter_modular/flutter_modular.dart';

import 'app_store.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_page.dart';
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
    ChildRoute(Modular.initialRoute, child: (_, __) => Login()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/scripts', module: RoteirosModule()),
  ];
}

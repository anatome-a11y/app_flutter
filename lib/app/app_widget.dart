import 'package:app_flutter/app/app_store.dart';
import 'package:app_flutter/app/app_viewmodel.dart';
import 'package:asuka/asuka.dart' as asuka;

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends ModularState<AppWidget, AppStore> {
  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<AppStore, Exception, AppViewModel>(
      store: store,
      onState: (_, state) => MaterialApp(
        title: 'Flutter Slidy',
        builder: asuka.builder,
        navigatorObservers: [
          asuka.asukaHeroController,
        ],
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.comfortable,
          scaffoldBackgroundColor: Colors.grey.shade300,
          // platform: TargetPlatform.iOS,
          brightness: state.isDarkTheme ? Brightness.dark : Brightness.light,
        ),
      ).modular(),
    );
  }
}

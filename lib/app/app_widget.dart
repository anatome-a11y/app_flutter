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
      onState: (_, state) => _App(
        appViewModel: state,
      ),
    );
  }
}

class _App extends StatelessWidget {
  final AppViewModel appViewModel;

  const _App({Key? key, required this.appViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anatome',
      builder: asuka.builder,
      navigatorObservers: [
        asuka.asukaHeroController,
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.pink,
        visualDensity: VisualDensity.comfortable,
        // platform: TargetPlatform.iOS,
        brightness:
            appViewModel.isDarkTheme ? Brightness.dark : Brightness.light,
      ),
    ).modular();
  }
}

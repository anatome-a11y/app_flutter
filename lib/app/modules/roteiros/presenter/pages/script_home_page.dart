import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:app_flutter/app/modules/roteiros/domain/usecases/init_exam.dart';
import 'package:app_flutter/app/modules/roteiros/presenter/components/exam_intro_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'script_home_store.dart';

class ScriptHomePage extends StatefulWidget {
  final String title;
  const ScriptHomePage({Key? key, this.title = "ScriptHomePage"})
      : super(key: key);
  @override
  ScriptHomePageState createState() => ScriptHomePageState();
}

class ScriptHomePageState
    extends ModularState<ScriptHomePage, ScriptHomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ScopedBuilder<ScriptHomeStore, Exception, Exam>(
          store: store,
          onState: (_, exam) => ExamIntroWidget(exam: exam),
          onError: (_, error) => Text('error'),
          onLoading: (_) => CircularProgressIndicator(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.swap_horiz),
          onPressed: () {
            store.initExam();
          },
        ));
  }
}

import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:app_flutter/app/modules/roteiros/domain/usecases/init_exam.dart';
import 'package:app_flutter/app/modules/roteiros/presenter/components/exam_intro_widget.dart';
import 'package:app_flutter/app/modules/roteiros/presenter/components/start_exam_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'script_home_states.dart';
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
      body: ScopedBuilder<ScriptHomeStore, Exception, ScriptHomeState>(
        store: store,
        onState: (_, state) => state is ScriptHomeExamState
            ? ExamIntroWidget(exam: state.exam)
            : NotStartedExam(store: store),
        onError: (_, error) => Text('error'),
        onLoading: (_) => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class NotStartedExam extends StatelessWidget {
  final ScriptHomeStore store;

  const NotStartedExam({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Clique no botão para iniciar o exame',
            style: TextStyle(fontSize: 30),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        StartExamFormWidget(initExam: (isTeorico, isLocalizar) {
          store.initExam(isTeorico, isLocalizar);
        })
      ],
    );
  }
}

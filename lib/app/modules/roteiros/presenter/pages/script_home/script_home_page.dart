import 'package:app_flutter/app/modules/roteiros/presenter/components/start_exam_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'script_home_states.dart';
import 'script_home_store.dart';

class ScriptHomePage extends StatefulWidget {
  final String title;
  const ScriptHomePage({Key? key, this.title = "Avaliação de roteiro"})
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
        onState: (_, state) => NotStartedExam(store: store),
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Clique no botão para iniciar o exame',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Expanded(
                      child: StartExamFormWidget(initExam: (mode) {
                        store.initExam(mode);
                      }),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:app_flutter/app/modules/roteiros/presenter/pages/exam/exam_state.dart';
import 'package:app_flutter/app/modules/roteiros/presenter/pages/exam/exam_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'components/exam_widget.dart';

class ExamPage extends StatefulWidget {
  final String title;
  const ExamPage({Key? key, this.title = "Avaliação"}) : super(key: key);
  @override
  ExamPageState createState() => ExamPageState();
}

class ExamPageState extends ModularState<ExamPage, ExamStore> {
  @override
  void initState() {
    super.initState();

    store.setExam();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ScopedBuilder<ExamStore, Exception, ExamState>(
        store: store,
        onState: (context, state) {
          if (state is ExamContentState) {
            return ExamWidget(
              exam: state.exam,
            );
          }

          return ExamWidget();
        },
      ),
    );
  }
}

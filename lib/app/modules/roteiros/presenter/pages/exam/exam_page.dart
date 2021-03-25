import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_mode.dart';
import 'package:app_flutter/app/modules/roteiros/presenter/pages/exam/exam_state.dart';
import 'package:app_flutter/app/modules/roteiros/presenter/pages/exam/exam_store.dart';
import 'package:app_flutter/app/modules/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'components/exam_widget.dart';

class ExamPage extends StatefulWidget {
  final String title;
  final ExamMode mode;

  const ExamPage({Key? key, this.title = "Avaliação", required this.mode})
      : super(key: key);
  @override
  ExamPageState createState() => ExamPageState();
}

class ExamPageState extends ModularState<ExamPage, ExamStore> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            },
          )
        ],
      ),
      body: _Body(store: store, mode: widget.mode),
    );
  }
}

class _Body extends StatelessWidget {
  final ExamStore store;
  final ExamMode mode;

  const _Body({Key? key, required this.store, required this.mode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Content(store: store, mode: mode);
  }
}

class _Content extends StatelessWidget {
  final ExamStore store;
  final ExamMode mode;

  const _Content({Key? key, required this.store, required this.mode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<ExamStore, Exception, ExamState>(
      store: store,
      onState: (context, state) {
        if (state is ExamContentState) {
          return ExamWidget(
            exam: state.exam,
            mode: mode,
          );
        }

        return ExamWidget(
          mode: mode,
          onInitExam: () {
            store.setExam();
          },
        );
      },
    );
  }
}

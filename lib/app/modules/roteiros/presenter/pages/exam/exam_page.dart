import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_mode.dart';
import 'package:app_flutter/app/modules/roteiros/presenter/components/bottom_nav_widget.dart';
import 'package:app_flutter/app/modules/roteiros/presenter/pages/exam/exam_state.dart';
import 'package:app_flutter/app/modules/roteiros/presenter/pages/exam/exam_store.dart';
import 'package:app_flutter/app/modules/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'components/exam_questions/dialogs/exam_info_dialog_widget.dart';
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

  void showInfoDialog() {
    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) => ExamInfoDialogWidget(
        mode: widget.mode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(widget.title, style: TextStyle(color: Colors.grey[600])),
        iconTheme: IconThemeData(
          color: Colors.grey[600],
        ),
        actionsIconTheme: IconThemeData(color: Colors.grey[600]),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.grey[600]),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            },
          )
        ],
      ),
      body: _Body(store: store, mode: widget.mode),
      bottomNavigationBar: ScopedBuilder<ExamStore, Exception, ExamState>(
        store: store,
        onState: (context, state) {
          return BottomNav(
              infoButtonPressed: showInfoDialog,
              showButtons: state is ExamContentState);
        },
      ),
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

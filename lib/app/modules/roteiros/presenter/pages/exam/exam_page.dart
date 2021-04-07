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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (store.state is ExamContentState) {
          final state = store.state as ExamContentState;

          if (state.examFinished) {
            return true;
          }
        }

        final result = await showDialog<bool>(
          context: context,
          useRootNavigator: false,
          builder: (context) => AlertDialog(
            title: Text('Confimação.'),
            content: Text('Confirma sua saída?'),
            actions: <Widget>[
              TextButton(
                child: Text('CANCELAR'),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              TextButton(
                child: Text('CONFIRMAR'),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
        );

        if (result == null) {
          return false;
        }

        return result;
      },
      child: Scaffold(
        appBar: _AppBar(store: store, widget: widget),
        body: _Body(store: store, mode: widget.mode),
        bottomNavigationBar: _BottomNavigationBar(
          store: store,
          mode: widget.mode,
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget with PreferredSizeWidget {
  const _AppBar({
    Key? key,
    required this.store,
    required this.widget,
  }) : super(key: key);

  final ExamStore store;
  final ExamPage widget;

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<ExamStore, Exception, ExamState>(
      store: store,
      onState: (context, state) => AppBar(
        automaticallyImplyLeading: false,
        leading: state is ExamContentState
            ? null
            : IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: Modular.to.maybePop,
              ),
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Settings(),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 56);
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

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.store,
    required this.mode,
  }) : super(key: key);

  final ExamStore store;
  final ExamMode mode;

  void showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) => ExamInfoDialogWidget(
        mode: mode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<ExamStore, Exception, ExamState>(
      store: store,
      onState: (context, state) {
        return BottomNav(
          infoButtonPressed: () => showInfoDialog(context),
          showButtons: state is ExamContentState,
        );
      },
    );
  }
}

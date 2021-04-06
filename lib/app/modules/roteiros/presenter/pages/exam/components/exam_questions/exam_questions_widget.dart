import 'dart:async';
import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_mode.dart';
import 'package:app_flutter/app/modules/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../../../main.dart';
import '../../exam_store.dart';
import 'dialogs/exam_timeout_dialog_widget.dart';
import 'dialogs/finished_exam_dialog_widget.dart';
import 'exam_questions_bottom.dart';
import 'exam_questions_content_widget.dart';
import 'exam_questions_control_buttons.dart';
import 'exam_questions_list.dart';

class ExamQuestionsWidget extends StatefulWidget {
  final Exam exam;
  final ExamMode mode;

  const ExamQuestionsWidget({Key? key, required this.exam, required this.mode})
      : super(key: key);

  @override
  _ExamQuestionsWidgetState createState() => _ExamQuestionsWidgetState();
}

class _ExamQuestionsWidgetState extends State<ExamQuestionsWidget> {
  int currentQuestionIndex = 0;
  Map<int, List<String>> responses = {};
  late int totalTime;
  int remainingTime = 0;

  late Timer timer;

  @override
  void initState() {
    setTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  setTimer() {
    Settings currentSettings = getIt<Settings>();
    totalTime = widget.mode.isToFind == true
        ? currentSettings.localizacao_teclado_tempo
        : currentSettings.conhecimento_teclado_tempo;

    remainingTime = totalTime;
    timer = Timer.periodic(Duration(seconds: 1), onTimerTick);
  }

  void onTimerTick(timer) {
    setState(() {
      remainingTime--;
    });

    if (remainingTime <= 0) {
      timer.cancel();
      onTimeEnd();
    }
  }

  void onTimeEnd() {
    showExamTimeoutDialog();
  }

  void showExamTimeoutDialog() {
    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) => ExamTimeoutDialogWidget(),
    );
  }

  void showFinishedDialog() {
    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) => FinishedExamDialogWidget(),
    );
  }

  void showExitBeforeFinishedDialog() {
    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) => ExitBeforeFinishDialogWidget(),
    );
  }

  void showExitBeforeInitDialog() {
    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) => ExitBeforeInitDialogWidget(),
    );
  }

  void onPrevClick() {
    setState(() {
      if (currentQuestionIndex > 0) {
        currentQuestionIndex--;
      }
    });
  }

  void onNextClick() {
    setState(() {
      if (currentQuestionIndex < widget.exam.questions.length - 1) {
        currentQuestionIndex++;
      }
    });
  }

  void onFinishClick() {
    //// Finaliza exame
    showFinishedDialog();
  }

  void onFinishClickBeforeFinish() {
    showExitBeforeFinishedDialog();
  }

  void onFinishClickBeforeInit() {
    showExitBeforeInitDialog();
  }

  void handleQuestionSubmit(responses) {
    setState(() {
      this.responses[currentQuestionIndex] = responses;
    });

    if (userWasRespondedAllQuestions()) {
      ExamStore examStore = Modular.get<ExamStore>();
      examStore.setExamAsFinished();
    }

    if (userWasRespondedOneQuestion()) {
      ExamStore examStore = Modular.get<ExamStore>();
      examStore.setExamAsInitied();
    }
  }

  bool userWasRespondedAllQuestions() {
    final totalQuestions = widget.exam.questions.length;
    final respondedQuestions = this.responses.keys.length;

    return totalQuestions == respondedQuestions;
  }

  bool userWasRespondedOneQuestion() {
    final respondedQuestions = this.responses.keys.length;

    return respondedQuestions > 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          _Body(
            exam: widget.exam,
            mode: widget.mode,
            currentQuestionIndex: currentQuestionIndex,
            remainingTime: remainingTime,
            totalTime: totalTime,
            responses: responses,
            onSelect: (index) {
              setState(
                () {
                  currentQuestionIndex = index;
                },
              );
            },
            onQuestionSubmit: handleQuestionSubmit,
          ),
          const SizedBox(
            height: 10,
          ),
          ControlButtons(
            exam: widget.exam,
            onPrev: onPrevClick,
            onNext: onNextClick,
            onFinish: onFinishClick,
            onBeforeInit: onFinishClickBeforeInit,
            onExitBeforeFinish: onFinishClickBeforeFinish,
          ),
          const SizedBox(
            height: 10,
          ),
          Bottom(
            exam: widget.exam,
            currentQuestionIndex: currentQuestionIndex,
            remainingTime: remainingTime,
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final Exam exam;
  final ExamMode mode;
  final int currentQuestionIndex;
  final Map<int, List<String>> responses;
  final Function(int index) onSelect;
  final int remainingTime;
  final int totalTime;
  final Function(List<String>) onQuestionSubmit;

  const _Body({
    Key? key,
    required this.exam,
    required this.mode,
    required this.currentQuestionIndex,
    required this.responses,
    required this.onSelect,
    required this.remainingTime,
    required this.totalTime,
    required this.onQuestionSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 60),
                child: QuestionsList(
                  exam: exam,
                  currentQuestionIndex: currentQuestionIndex,
                  onSelect: onSelect,
                  remainingTime: remainingTime,
                  totalTime: totalTime,
                  responses: responses,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: QuestionContent(
                  exam: exam,
                  mode: mode,
                  currentQuestionIndex: currentQuestionIndex,
                  responses: responses[currentQuestionIndex],
                  onQuestionSubmit: onQuestionSubmit,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

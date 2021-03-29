import 'dart:async';
import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'exam_questions_bottom.dart';
import 'exam_questions_content_widget.dart';
import 'exam_questions_control_buttons.dart';
import 'exam_questions_list.dart';
import 'finished_exam_dialog_widget.dart';

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
  int totalTime = 120;
  int remainingTime = 0;

  late Timer timer;

  @override
  void initState() {
    super.initState();

    remainingTime = totalTime;
    timer = Timer.periodic(Duration(seconds: 1), onTimerTick);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void onTimerTick(timer) {
    setState(() {
      remainingTime--;
      print(remainingTime);
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
      builder: (context) => ExamTimeoutDialogWidget(),
    );
  }

  void showFinishedDialog() {
    showDialog(
      context: context,
      builder: (context) => FinishedExamDialogWidget(),
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
    showFinishedDialog();
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
            onSelect: (index) {
              setState(
                () {
                  currentQuestionIndex = index;
                },
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ControlButtons(
            exam: widget.exam,
            onPrev: onPrevClick,
            onNext: onNextClick,
            onFinish: onFinishClick,
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
  final Function(int index) onSelect;
  final int remainingTime;
  final int totalTime;

  const _Body({
    Key? key,
    required this.exam,
    required this.mode,
    required this.currentQuestionIndex,
    required this.onSelect,
    required this.remainingTime,
    required this.totalTime,
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
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

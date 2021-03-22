import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_mode.dart';
import 'package:flutter/material.dart';

import 'exam_instructions_widget.dart';
import 'exam_loading_widget.dart';
import 'exam_question_widget.dart';

class ExamWidget extends StatefulWidget {
  final Exam? exam;
  final ExamMode mode;

  final Function()? onInitExam;

  const ExamWidget({Key? key, this.exam, this.onInitExam, required this.mode})
      : super(key: key);

  @override
  _ExamWidgetState createState() => _ExamWidgetState();
}

class _ExamWidgetState extends State<ExamWidget> {
  bool isShowingInstructions = true;

  @override
  Widget build(BuildContext context) {
    if (isShowingInstructions) {
      return ExamInstructionsWidget(
        mode: widget.mode,
        onInitExam: () {
          setState(() {
            isShowingInstructions = false;

            if (widget.onInitExam != null) {
              widget.onInitExam!();
            }
          });
        },
      );
    }

    final exam = widget.exam;

    if (exam != null) {
      return ExamQuestionsWidget(
        exam: exam,
        mode: widget.mode,
      );
    }

    return ExamLoadingWidget();
  }
}

import 'package:flutter/material.dart';

import 'exam_instructions_widget.dart';
import 'exam_question_widget.dart';

class ExamWidget extends StatefulWidget {
  @override
  _ExamWidgetState createState() => _ExamWidgetState();
}

class _ExamWidgetState extends State<ExamWidget> {
  bool isShowingInstructions = true;

  @override
  Widget build(BuildContext context) {
    if (isShowingInstructions) {
      return ExamInstructionsWidget(
        onInitExam: () {
          setState(() {
            isShowingInstructions = false;
          });
        },
      );
    }

    return ExamQuestionsWidget();
  }
}

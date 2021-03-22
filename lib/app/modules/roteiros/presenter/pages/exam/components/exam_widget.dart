import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'exam_instructions_widget.dart';
import 'exam_question_widget.dart';

class ExamWidget extends StatefulWidget {
  final Exam? exam;

  const ExamWidget({Key? key, this.exam}) : super(key: key);

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

    if (widget.exam == null) {
      return LoadingWidget();
    }

    return ExamQuestionsWidget();
  }
}

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      // baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[400]!,
      enabled: true,
      child: ListView.builder(
        itemBuilder: (_, __) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 48.0,
                height: 48.0,
                color: Colors.white,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 8.0,
                      color: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Container(
                      width: double.infinity,
                      height: 8.0,
                      color: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Container(
                      width: 40.0,
                      height: 8.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        itemCount: 6,
      ),
    );
  }
}

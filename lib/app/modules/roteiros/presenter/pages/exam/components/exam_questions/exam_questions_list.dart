import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:flutter/material.dart';

class QuestionsList extends StatelessWidget {
  final Exam exam;
  final int currentQuestionIndex;
  final int remainingTime;
  final int totalTime;
  final Function(int index) onSelect;

  QuestionsList({
    Key? key,
    required this.exam,
    required this.currentQuestionIndex,
    required this.onSelect,
    required this.remainingTime,
    required this.totalTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final timePerQuestion = totalTime / exam.questions.length;
    // final timeSpent = totalTime - remainingTime;

    return ListView.builder(
      itemCount: exam.questions.length,
      itemBuilder: (context, index) {
        Color itemColor = Colors.white;
        Color textColor = Colors.black;

        // final maxTimeForThisQuestion = timePerQuestion * (index + 1);

        // if (timeSpent >= maxTimeForThisQuestion) {
        //   itemColor = Colors.red;
        //   textColor = Colors.white;
        // }

        if (currentQuestionIndex == index) {
          itemColor = Colors.black45;
          textColor = Colors.white;
        }

        return Card(
          color: itemColor,
          child: InkWell(
            onTap: () {
              onSelect(index);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                '${index + 1}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

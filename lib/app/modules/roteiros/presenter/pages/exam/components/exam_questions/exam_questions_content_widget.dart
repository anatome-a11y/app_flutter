import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_mode.dart';
import 'package:flutter/material.dart';

import 'dialogs/exam_questions_response_dialog.dart';

class QuestionContent extends StatelessWidget {
  final Exam exam;
  final ExamMode mode;
  final int currentQuestionIndex;

  const QuestionContent({
    Key? key,
    required this.exam,
    required this.mode,
    required this.currentQuestionIndex,
  }) : super(key: key);

  Future<void> _showResponseDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (context) => ExamQuestionResposeDialog(
        mode: mode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = exam.questions[currentQuestionIndex];

    return Card(
      child: InkWell(
        onTap: () => _showResponseDialog(context),
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    question.part.piece.name,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Divider(height: 10),
                const SizedBox(
                  height: 10,
                ),
                if (mode.isTheoretical && mode.isToFind)
                  _theoricalFindQuestion(),
                if (mode.isTheoretical && !mode.isToFind)
                  _theoricalContentQuestion(),
                if (!mode.isTheoretical && mode.isToFind)
                  _praticalFindQuestion(),
                if (!mode.isTheoretical && !mode.isToFind)
                  _praticalContentQuestion(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Clique para inserir a resposta',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _theoricalFindQuestion() {
    final question = exam.questions[currentQuestionIndex];

    return Container(
        width: double.infinity,
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(1.0),
            //   child: Text(
            //     '''${question.part.name}''',
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       fontSize: 25,
            //       color: Colors.black45,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '${question.part.theoreticalContent[0]}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              height: 20,
            ),
          ],
        ));
  }

  Widget _theoricalContentQuestion() {
    final question = exam.questions[currentQuestionIndex];

    return Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                'Parte ${question.part.number}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.black45),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              height: 20,
            ),
          ],
        ));
  }

  Widget _praticalContentQuestion() {
    final question = exam.questions[currentQuestionIndex];

    return Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                'Parte ${question.part.number}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.black45),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              height: 20,
            ),
          ],
        ));
  }

  Widget _praticalFindQuestion() {
    final question = exam.questions[currentQuestionIndex];

    return Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                '${question.part.name}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.black45),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              height: 20,
            ),
          ],
        ));
  }
}

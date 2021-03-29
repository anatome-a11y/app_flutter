import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_mode.dart';
import 'package:flutter/material.dart';

class QuestionContent extends StatelessWidget {
  final Exam exam;
  final ExamMode mode;
  final int currentQuestionIndex;

  const QuestionContent(
      {Key? key,
      required this.exam,
      required this.mode,
      required this.currentQuestionIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final question = exam.questions[currentQuestionIndex];

    return Card(
      child: SingleChildScrollView(
        child: InkWell(
          onTap: () {
            print('ssss');
            _showMyDialog(context);
          },
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
              Divider(
                height: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              if (mode.isTheoretical && mode.isToFind) _TheoricalFindQuestion(),
              if (mode.isTheoretical && !mode.isToFind)
                _TheoricalContentQuestion(),
              if (!mode.isTheoretical && mode.isToFind) _PraticalFindQuestion(),
              if (!mode.isTheoretical && !mode.isToFind)
                _PraticalContentQuestion(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    var text = '';

    if (mode.isTheoretical && mode.isToFind) text = 'Número da parte';
    if (mode.isTheoretical && !mode.isToFind) text = 'Nome da parte';
    if (!mode.isTheoretical && mode.isToFind) text = 'Número da parte';
    if (!mode.isTheoretical && !mode.isToFind) text = 'Nome da parte';

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Escreva sua resposta.'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    maxLines: 1,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: text,
                    ),
                  ),
                ),
                if (mode.isTheoretical && !mode.isToFind)
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      minLines: 3,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Conteúdo teórico',
                      ),
                    ),
                  ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Responder'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _TheoricalFindQuestion() {
    final question = exam.questions[currentQuestionIndex];

    return Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                '''${question.part.name}''',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.black45),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(
              height: 20,
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                '${question.part.theoreticalContent[0]}',
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ));
  }

  Widget _TheoricalContentQuestion() {
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
          ],
        ));
  }

  Widget _PraticalContentQuestion() {
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
          ],
        ));
  }

  Widget _PraticalFindQuestion() {
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
            // Padding(
            //   padding: const EdgeInsets.all(6.0),
            //   child: TextField(
            //     keyboardType: TextInputType.number,
            //     autofocus: true,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       hintText: 'Número da parte',
            //     ),
            //   ),
            // ),
            Divider(
              height: 20,
            ),
          ],
        ));
  }
}

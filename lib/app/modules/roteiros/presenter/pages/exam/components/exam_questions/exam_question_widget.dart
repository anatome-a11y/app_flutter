import 'dart:async';
import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
  int totalTime = 120;
  int remainingTime = 0;

  late Timer timer;

  @override
  void initState() {
    super.initState();

    remainingTime = totalTime;

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        remainingTime--;
        print(remainingTime);
      });

      if (remainingTime <= 0) {
        timer.cancel();

        onTimeEnd();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void onTimeEnd() {
    print('time end');
    showFinishedDialog();
  }

  void showFinishedDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () => Future.value(true),
          child: AlertDialog(
            title: new Text("Tempo encerrado"),
            content: Text("Fechar"),
            actions: <Widget>[
              // define os botões na base do dialogo
              new ElevatedButton(
                child: new Text("Fechar"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Modular.to.pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);

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
              setState(() {
                currentQuestionIndex = index;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          _ControlButtons(
            exam: widget.exam,
            onPrev: () {
              setState(() {
                if (currentQuestionIndex > 0) {
                  currentQuestionIndex--;
                }
              });
            },
            onNext: () {
              setState(() {
                if (currentQuestionIndex < widget.exam.questions.length - 1) {
                  currentQuestionIndex++;
                }
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          _Bottom(
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
                child: _QuestionContent(
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

class _QuestionContent extends StatelessWidget {
  final Exam exam;
  final ExamMode mode;
  final int currentQuestionIndex;

  const _QuestionContent(
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
              if (!mode.isTheoretical && mode.isToFind)
                _PraticallFindQuestion(),
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
            /*Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextField(
                keyboardType: TextInputType.number,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Número da parte',
                ),
              ),
            ),*/
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
            // Padding(
            //   padding: const EdgeInsets.all(6.0),
            //   child: TextField(
            //     keyboardType: TextInputType.text,
            //     autofocus: true,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Nome da parte',
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(6.0),
            //   child: TextField(
            //     keyboardType: TextInputType.multiline,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Conteúdo teórico',
            //     ),
            //   ),
            // ),
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
            /*Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextField(
                keyboardType: TextInputType.text,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome da parte',
                ),
              ),
            ),*/
          ],
        ));
  }

  Widget _PraticallFindQuestion() {
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

class _ControlButtons extends StatelessWidget {
  final Exam exam;
  final Function() onPrev;
  final Function() onNext;

  const _ControlButtons(
      {Key? key,
      required this.exam,
      required this.onPrev,
      required this.onNext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: onPrev,
            child: Container(
              height: 60,
              child: Center(
                child: Icon(Icons.arrow_back),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 3,
          child: ElevatedButton(
            onPressed: onNext,
            child: Container(
              height: 60,
              child: Center(
                child: Text("Finalizar"),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: onNext,
            child: Container(
              height: 60,
              child: Center(
                child: Icon(Icons.arrow_forward),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Bottom extends StatelessWidget {
  final Exam exam;
  final int currentQuestionIndex;
  final int remainingTime;

  const _Bottom({
    Key? key,
    required this.exam,
    required this.currentQuestionIndex,
    required this.remainingTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: SingleChildScrollView(
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(left: 16),
                title: Text(
                  'Resumo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Divider(),
              _cardContent()
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: _section(
              'Etapa',
              '${currentQuestionIndex + 1} / ${exam.questions.length}',
            ),
          ),
          Expanded(
            child: _section(
              'Tempo',
              '$remainingTime',
            ),
          )
        ],
      ),
    );
  }

  Widget _section(String title, String content) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        _board(content)
      ],
    );
  }

  Widget _board(String content) {
    return Card(
      color: Colors.grey.shade800,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          content,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

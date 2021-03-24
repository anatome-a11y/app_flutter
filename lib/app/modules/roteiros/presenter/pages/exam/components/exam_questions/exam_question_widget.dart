import 'dart:async';

import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_mode.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/question.dart';
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
  int remainingTime = 120;

  late Timer timer;

  @override
  void initState() {
    super.initState();

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
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Alert Dialog titulo"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new ElevatedButton(
              child: new Text("Fechar"),
              onPressed: () {
                print('pressed');
                Navigator.of(context).pop();
                Modular.to.pop();
              },
            ),
          ],
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

  const _Body(
      {Key? key,
      required this.exam,
      required this.mode,
      required this.currentQuestionIndex,
      required this.onSelect})
      : super(key: key);

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

          if (mode.isTheoretical && mode.isToFind)
              Container(),

          if (mode.isTheoretical && !mode.isToFind)
            _TheoricalFindQuestion(),// TheoreticalFind(question)

          /*Text('Parte ${question.part.number}'),
          TextField(
            decoration: InputDecoration(
              hintText: 'Nome da parte',
            ),
          ),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              hintText: 'Conteúdos teóricos',
            ),
          )*/
        ],
      ),
    );
  }

  Widget _TheoricalFindQuestion(){
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
              style: TextStyle(
                fontSize: 25, 
                color: Colors.black45
              ),
            ),
            ),
            const SizedBox(
              height: 5,
            ),

            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Digite o nome da peça'
                ),
              ),
            ),

            Divider(
              height: 20,
            ),
            
            const SizedBox(
              height: 5,
            ),
            
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: 
                Text(
                  '${question.part.theoreticalContent[0]}',
                  textAlign: TextAlign.justify,
                ), 
            ),

          ],
        ) 
      
      /*child: Text(
        'Parte ${question.part.number}',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25, 
          color: Colors.black45
        ),
        
        )
      
      const Divider(height: 20,)

      ),
      */

    );
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

import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_mode.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/question.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          _Body(
            exam: widget.exam,
            mode: widget.mode,
            currentQuestionIndex: currentQuestionIndex,
          ),
          const SizedBox(
            height: 20,
          ),
          _ControlButtons(
            exam: widget.exam,
            onPrev: () {
              print('prev');
              currentQuestionIndex--;
            },
            onNext: () {
              setState(() {
                print('next');
                currentQuestionIndex++;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          _Bottom(exam: widget.exam),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final Exam exam;
  final ExamMode mode;
  final int currentQuestionIndex;

  const _Body(
      {Key? key,
      required this.exam,
      required this.mode,
      required this.currentQuestionIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 50),
            child: _QuestionsList(exam: exam),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: _QuestionContent(
                exam: exam,
                mode: mode,
                currentQuestionIndex: currentQuestionIndex),
          )
        ],
      ),
    );
  }
}

class _QuestionsList extends StatelessWidget {
  final Exam exam;

  const _QuestionsList({Key? key, required this.exam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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
    return Card(
      child: Column(
        children: [
          Text('Questão $currentQuestionIndex', style: TextStyle(fontSize: 30)),
          const SizedBox(
            height: 20,
          ),
          if (mode.isTheoretical) Text('É conteúdo teórico')
          else Text("É conteúdo Prático"),
        ],
      ),
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

  const _Bottom({Key? key, required this.exam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Exame tem ${exam.questions.length} questões');
  }
}

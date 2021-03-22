import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_mode.dart';
import 'package:flutter/material.dart';

class StartExamFormWidget extends StatefulWidget {
  final Function(ExamMode mode) initExam;

  const StartExamFormWidget({Key? key, required this.initExam})
      : super(key: key);

  @override
  _StartExamFormWidgetState createState() => _StartExamFormWidgetState();
}

class _StartExamFormWidgetState extends State<StartExamFormWidget> {
  bool isTheoretical = false;
  bool isToFind = false;

  _StartExamFormWidgetState();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tipo de conteúdo', style: TextStyle(fontSize: 20)),
        RadioListTile(
          title: const Text('Conteúdo Teórico'),
          value: true,
          groupValue: isTheoretical,
          onChanged: (bool? value) {
            setState(() {
              isTheoretical = true;
            });
          },
        ),
        RadioListTile(
          title: const Text('Conteúdo Prático'),
          value: false,
          groupValue: isTheoretical,
          onChanged: (bool? value) {
            setState(() {
              isTheoretical = false;
            });
          },
        ),
        SizedBox(
          height: 15,
        ),
        Text('Sentido de localização', style: TextStyle(fontSize: 20)),
        RadioListTile(
          title: const Text('Conteúdo -> Localização'),
          value: true,
          groupValue: isToFind,
          onChanged: (bool? value) {
            setState(() {
              isToFind = true;
            });
          },
        ),
        RadioListTile(
          title: const Text('Localização -> Conteúdo'),
          value: false,
          groupValue: isToFind,
          onChanged: (bool? value) {
            setState(() {
              isToFind = false;
            });
          },
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Container(),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              widget.initExam(
                ExamMode(
                  isTheoretical: isTheoretical,
                  isToFind: isToFind,
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text(
                  'Iniciar exame',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

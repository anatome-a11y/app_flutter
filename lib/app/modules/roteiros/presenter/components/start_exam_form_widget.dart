import 'package:flutter/material.dart';

class StartExamFormWidget extends StatefulWidget {
  final Function(bool isTeorico, bool isLocalizar) initExam;

  const StartExamFormWidget({Key? key, required this.initExam})
      : super(key: key);

  @override
  _StartExamFormWidgetState createState() =>
      _StartExamFormWidgetState(initExam);
}

class _StartExamFormWidgetState extends State<StartExamFormWidget> {
  final Function(bool isTeorico, bool isLocalizar) initExam;

  bool isTeorico = false;
  bool isLocalizar = false;

  _StartExamFormWidgetState(this.initExam);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tipo de conteúdo', style: TextStyle(fontSize: 20)),
        RadioListTile(
          title: const Text('Conteúdo Teórico'),
          value: true,
          groupValue: isTeorico,
          onChanged: (bool? value) {
            setState(() {
              isTeorico = true;
            });
          },
        ),
        RadioListTile(
          title: const Text('Conteúdo Prático'),
          value: false,
          groupValue: isTeorico,
          onChanged: (bool? value) {
            setState(() {
              isTeorico = false;
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
          groupValue: isLocalizar,
          onChanged: (bool? value) {
            setState(() {
              isLocalizar = true;
            });
          },
        ),
        RadioListTile(
          title: const Text('Localização -> Conteúdo'),
          value: false,
          groupValue: isLocalizar,
          onChanged: (bool? value) {
            setState(() {
              isLocalizar = false;
            });
          },
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              initExam(isTeorico, isLocalizar);
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

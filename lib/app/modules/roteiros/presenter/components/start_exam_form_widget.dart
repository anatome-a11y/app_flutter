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
        /*Text('Tipo de conteúdo'),
        Text('( ) Teórico'),
        Text('( ) Prático'),
        Text('Sentido de identificação'),
        Text('( ) ...'),
<<<<<<< HEAD
        Text('( ) ...'),*/
        ListTile(
          title: const Text('Conteúdo Teórico'),
          leading: Radio<bool>(
            value: isTeorico,
            groupValue: true,
            onChanged: (bool? value) {
              setState(() {
                isTeorico = true;
                isLocalizar = false;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Localizar peças'),
          leading: Radio<bool>(
            value: isLocalizar,
            groupValue: true,
            onChanged: (bool? value) {
              setState(() {
                isLocalizar = true;
                isTeorico = false;
              });
            },
          ),
        ),
        /*SwitchListTile(
          title: const Text('Conteúdo teórico'),
          value: isTeorico,
          onChanged: (bool value) {
            setState(() {
              isTeorico = value;
            });
          },
        ),
        SwitchListTile(
          title: const Text('Localizar peças'),
          value: isLocalizar,
          onChanged: (bool value) {
            setState(() {
              isLocalizar = value;
            });
          },
        ),
        SizedBox(
          height: 50,
        ),*/
        Center(
          child: ElevatedButton(
            onPressed: () {
              initExam(isTeorico, isLocalizar);
            },
            child: Text(
              'Iniciar exame',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}

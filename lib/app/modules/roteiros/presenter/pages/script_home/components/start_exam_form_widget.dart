import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../script_home_store.dart';

class StartExamFormWidget extends StatefulWidget {
  const StartExamFormWidget({Key? key}) : super(key: key);

  @override
  _StartExamFormWidgetState createState() => _StartExamFormWidgetState();
}

class _StartExamFormWidgetState extends State<StartExamFormWidget> {
  bool isTheoretical = false;
  bool isToFind = true;

  _StartExamFormWidgetState();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Tipo de conteúdo', style: TextStyle(fontSize: 20)),
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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Sentido de localização',
                    style: TextStyle(fontSize: 20)),
              ),
              RadioListTile(
                title: const Text('Conteúdo → Localização'),
                value: true,
                groupValue: isToFind,
                onChanged: (bool? value) {
                  setState(() {
                    isToFind = true;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Localização → Conteúdo'),
                value: false,
                groupValue: isToFind,
                onChanged: (bool? value) {
                  setState(() {
                    isToFind = false;
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Container(),
        ),
        Center(
          child: StartExamButton(
            isTheoretical: isTheoretical,
            isToFind: isToFind,
          ),
        ),
      ],
    );
  }
}

class StartExamButton extends StatelessWidget {
  const StartExamButton({
    Key? key,
    required this.isTheoretical,
    required this.isToFind,
  }) : super(key: key);

  final bool isTheoretical;
  final bool isToFind;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScriptHomeStore store = Modular.get<ScriptHomeStore>();

        store.initExam(
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
    );
  }
}

import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_mode.dart';
import 'package:flutter/material.dart';

class ExamInstructionsWidget extends StatelessWidget {
  final ExamMode mode;
  final Function() onInitExam;

  const ExamInstructionsWidget(
      {Key? key, required this.onInitExam, required this.mode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Instruções',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    getText(),
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(child: Container()),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(14),
          child: ElevatedButton(
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
            onPressed: onInitExam,
          ),
        ),
      ],
    );
  }

  String getText() {
    return '''Exibir instruções, que variam de acordo com o modo selecionado. 

É conteúdo teórico: ${mode.isTheoretical}.
É para localizar peças: ${mode.isToFind}''';
  }
}

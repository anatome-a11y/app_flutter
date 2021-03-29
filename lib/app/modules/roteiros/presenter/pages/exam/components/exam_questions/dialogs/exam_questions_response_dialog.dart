import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExamQuestionResposeDialog extends StatelessWidget {
  final ExamMode mode;

  const ExamQuestionResposeDialog({Key? key, required this.mode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = 'Nome da parte';
    TextInputType keyboardType = TextInputType.text;
    List<TextInputFormatter> inputFormatters = [];

    if (mode.isToFind) {
      text = 'Número da parte';
      keyboardType = TextInputType.number;
      inputFormatters = [FilteringTextInputFormatter.digitsOnly];
    }

    return AlertDialog(
      title: Text('Escreva sua resposta.'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextField(
                keyboardType: keyboardType,
                textInputAction: TextInputAction.next,
                inputFormatters: inputFormatters,
                maxLines: 1,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: text,
                ),
              ),
            ),
            if (mode.isTheoretical && !mode.isToFind)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      minLines: 3,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Conteúdos teóricos',
                      ),
                    ),
                  ),
                  Text('(Digite um conteúdo teórico por linha)')
                ],
              ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('CONFIRMAR'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_mode.dart';
import 'package:flutter/material.dart';

class ExamInfoDialogWidget extends StatelessWidget {
  final ExamMode mode;

  const ExamInfoDialogWidget({Key? key, required this.mode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Instruções"),
      content: Text(
        mode.getText(),
      ),
      actions: <Widget>[
        // define os botões na base do dialogo
        new TextButton(
          child: Center(
            child: Text("OK"),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

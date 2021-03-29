import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FinishedExamDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Modular.to.pop();
        return true;
      },
      child: AlertDialog(
        title: Text("Tempo encerrado"),
        content: Text(
          "Seu tempo para realizar o exame acabou. Tente novamente.",
        ),
        actions: <Widget>[
          // define os botões na base do dialogo
          new TextButton(
            child: Center(
              child: Text("OK"),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Modular.to.pop();
            },
          ),
        ],
      ),
    );
  }
}

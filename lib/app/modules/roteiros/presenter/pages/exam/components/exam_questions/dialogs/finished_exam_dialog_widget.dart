import 'package:app_flutter/app/modules/roteiros/roteiros_module.dart';
import 'package:flutter/material.dart';

class FinishedExamDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        RoteirosModule.popUntilScriptsHomePage();
        return true;
      },
      child: AlertDialog(
        title: Text("Exame finalizado"),
        content: Text(
          "Você finalizou seu exame. Boa sorte!",
        ),
        actions: <Widget>[
          // define os botões na base do dialogo
          new TextButton(
            child: Center(
              child: Text("OK"),
            ),
            onPressed: () {
              RoteirosModule.popUntilScriptsHomePage();
            },
          ),
        ],
      ),
    );
  }
}

class ExitBeforeFinishDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        RoteirosModule.popUntilScriptsHomePage();
        return true;
      },
      child: AlertDialog(
        title: Text("Exame Incompleto."),
        content: Text(
          "Você possui questões não finalizadas. Confima sua sua saída?",
        ),
        actions: <Widget>[
          new TextButton(
            child: Center(
              child: Text("CANCELAR"),
            ),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          // define os botões na base do dialogo
          new TextButton(
            child: Center(
              child: Text("CONFIRMAR"),
            ),
            onPressed: () {
              RoteirosModule.popUntilScriptsHomePage();
            },
          ),
        ],
      ),
    );
  }
}

class ExitBeforeInitDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        RoteirosModule.popUntilScriptsHomePage();
        return true;
      },
      child: AlertDialog(
        title: Text("Exame não iniciado."),
        content: Text(
          "Para saír é necessário responder pelo menos uma questão.",
        ),
        actions: <Widget>[
          // define os botões na base do dialogo
          new TextButton(
              child: Center(
                child: Text("OK"),
              ),
              onPressed: () {
                Navigator.pop(context, true);
              }),
        ],
      ),
    );
  }
}

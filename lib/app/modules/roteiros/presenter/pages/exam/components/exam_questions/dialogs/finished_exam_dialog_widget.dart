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

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:app_flutter/app/modules/settings/settings_model.dart';

class EntradaWidget extends StatefulWidget {

  @override
  _EntradaState createState() => _EntradaState();
}

class _EntradaState extends State<EntradaWidget> {

  int groupValue = -1;
  int result = -1;

  @override
  Widget build(BuildContext context) {

    GetIt getIt = GetIt.instance;

    void onChange ( int? value ) {
      setState(() {
        if ( value != null) {
          groupValue = value;
          result = groupValue;

          Settings currentSettings = getIt<Settings>();

          switch ( result ) {
            case 0 :
              currentSettings.entrada = Entrada.NFC;
              break;
            case 1 :
              currentSettings.entrada = Entrada.VOZ;
              break;
            case 2 :
              currentSettings.entrada = Entrada.TECLADO;
              break;
          }

        }
      });
    }

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical : 10),
            color: Colors.grey[200],
            child: Text('Entrada'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(value: 0, groupValue: groupValue, onChanged: onChange),
              Text("Leitura de etiquetas com NFC")
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(value: 1, groupValue: groupValue, onChanged: onChange),
              Text("Inserção de texto por voz")
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(value: 2, groupValue: groupValue, onChanged: onChange),
              Text("Inserção de texto via teclado")
            ],
          )
        ],
      ),
    );
  }
}

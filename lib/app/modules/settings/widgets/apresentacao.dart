import 'package:app_flutter/app/modules/settings/settings_model.dart';
import "package:flutter/material.dart";
import 'package:get_it/get_it.dart';

class ApresentacaoWidget extends StatefulWidget {
  @override
  _ApresentacaoState createState() => _ApresentacaoState();
}

class _ApresentacaoState extends State<ApresentacaoWidget> {

  int groupValue = -1;
  int result = -1;

  GetIt getIt = GetIt.instance;

  void onChange ( int? value ) {
    setState(() {
      if ( value != null) {
        groupValue = value;
        result = groupValue;

        Settings currentSettings = getIt<Settings>();

        switch ( result ) {
          case 0 :
            currentSettings.apresentacao = Apresentacao.IMAGEM;
            break;
          case 1 :
            currentSettings.apresentacao = Apresentacao.VIDEO;
            break;
          case 2 :
            currentSettings.apresentacao = Apresentacao.TEXTO;
            break;
          case 3 :
            currentSettings.apresentacao = Apresentacao.AUDIO;
            break;
        }
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical : 10),
            color: Colors.grey[200],
            child: Text('Apresentação de conhecimento'),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Leitor de tela: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  'DESATIVADO',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500
                  ),
                ) 
              ],
            ),
          ),
          Row (
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(value: 0, groupValue: groupValue, onChanged: onChange),
              Text("Imagem")
            ],
          ),
          Divider(),
          Row (
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(value: 1, groupValue: groupValue, onChanged: onChange),
              Text("Vídeo")
            ],
          ),
          Divider(),
          Row (
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(value: 2, groupValue: groupValue, onChanged: onChange),
              Text("Texto")
            ],
          ),
          Divider(),
          Row (
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(value: 3, groupValue: groupValue, onChanged: onChange),
              Text("Áudio")
            ],
          )
        ],
      ),
    );
  }
}

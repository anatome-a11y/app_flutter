import "package:flutter/material.dart";

class Apresentacao extends StatefulWidget {
  @override
  _ApresentacaoState createState() => _ApresentacaoState();
}

class _ApresentacaoState extends State<Apresentacao> {

  int groupValue = -1;
  int result = -1;

  void onChange ( int? value ) {
    setState(() {
      if ( value != null) {
        groupValue = value;
        result = groupValue;
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

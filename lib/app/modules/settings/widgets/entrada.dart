import 'package:flutter/material.dart';

class Entrada extends StatefulWidget {

  @override
  _EntradaState createState() => _EntradaState();
}

class _EntradaState extends State<Entrada> {

  int groupValue = -1;
  int result = -1;

  @override
  Widget build(BuildContext context) {

    void onChange ( int? value ) {
      setState(() {
        if ( value != null) {
          groupValue = value;
          result = groupValue;
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

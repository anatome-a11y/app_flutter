import "package:flutter/material.dart";

class Interacao extends StatefulWidget {
  @override
  _InteracaoState createState() => _InteracaoState();
}

class _InteracaoState extends State<Interacao> {

  int groupValueA = -1;
  int resultA = -1;
  int groupValueB = -1;
  int resultB = -1;
  int tempoLimiteVoz = 30;
  int tempoLimiteTeclado = 40;
  int tempoLimiteLocNFC = 10;
  int tempoLimiteLocVoz = 20;
  int tempoLimiteLocTeclado = 30;

  void onChangeA ( int? value ) {
    setState(() {
      if ( value != null) {
        groupValueA = value;
        resultA = groupValueA;
      }
    });
  }
  
  void onChangeB ( int? value ) {
    setState(() {
      if ( value != null) {
        groupValueB = value;
        resultB = groupValueB;
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
            child: Text('Interação'),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical : 10),
            child: Text('Conhecimento'),
          ),
          Container (
            child: Column (
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container (
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical : 10),
                  width: double.infinity,
                  child: Text(
                    "Tempo limite",
                    style : TextStyle(
                      color: Colors.blue,
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 20.0),
                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(value: 0, groupValue: groupValueA, onChanged: onChangeA),
                          Text('Voz')
                        ],
                      ),
                      Text(
                        tempoLimiteVoz.toString()
                      )
                    ],
                  ),
                ),
                Slider (
                  onChanged: (double value) {
                    setState(() {
                      tempoLimiteVoz = value.toInt();
                    });
                  },
                  value: tempoLimiteVoz.toDouble(),
                  min: 5.0,
                  max: 180.0,
                  divisions: ( 180 - 5 ) - 1,
                  label: "$tempoLimiteVoz"
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 20.0),
                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(value: 1, groupValue: groupValueA, onChanged: onChangeA),
                          Text('Teclado')
                        ],
                      ),
                      Text(
                        tempoLimiteTeclado.toString()
                      )
                    ],
                  ),
                ),
                Slider (
                  onChanged: (double value) {
                    setState(() {
                      tempoLimiteTeclado = value.toInt();
                    });
                  },
                  value: tempoLimiteTeclado.toDouble(),
                  min: 5.0,
                  max: 180.0,
                  divisions: ( 180 - 5 ) - 1,
                  label: "$tempoLimiteTeclado"
                )
              ],
            )
          ),
          Divider(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical : 10),
            child: Text('Localização'),
          ),
          Container (
            child: Column (
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container (
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical : 10),
                  width: double.infinity,
                  child: Text(
                    "Tempo limite",
                    style : TextStyle(
                      color: Colors.blue,
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 20.0),
                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(value: 0, groupValue:groupValueB, onChanged: onChangeB),
                          Text('NFC')
                        ],
                      ),
                      Text(
                        tempoLimiteLocNFC.toString()
                      )
                    ],
                  ),
                ),
                Slider (
                  onChanged: (double value) {
                    setState(() {
                      tempoLimiteLocNFC = value.toInt();
                    });
                  },
                  value: tempoLimiteLocNFC.toDouble(),
                  min: 5.0,
                  max: 180.0,
                  divisions: ( 180 - 5 ) - 1,
                  label: "$tempoLimiteLocNFC"
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 20.0),
                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(value: 1, groupValue: groupValueB, onChanged: onChangeB),
                          Text('Voz')
                        ],
                      ),
                      Text(
                        tempoLimiteLocVoz.toString()
                      )
                    ],
                  ),
                ),
                Slider (
                  onChanged: (double value) {
                    setState(() {
                      tempoLimiteLocVoz = value.toInt();
                    });
                  },
                  value: tempoLimiteLocVoz.toDouble(),
                  min: 5.0,
                  max: 180.0,
                  divisions: ( 180 - 5 ) - 1,
                  label: "$tempoLimiteLocVoz"
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 20.0),
                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(value: 2, groupValue: groupValueB, onChanged: onChangeB),
                          Text('Teclado')
                        ],
                      ),
                      Text(
                        tempoLimiteLocTeclado.toString()
                      )
                    ],
                  ),
                ),
                Slider (
                  onChanged: (double value) {
                    setState(() {
                      tempoLimiteLocTeclado = value.toInt();
                    });
                  },
                  value: tempoLimiteLocTeclado.toDouble(),
                  min: 5.0,
                  max: 180.0,
                  divisions: ( 180 - 5 ) - 1,
                  label: "$tempoLimiteLocTeclado"
                )
              ],
            )
          ),
        ]
      )
    );
  }
}

import 'package:app_flutter/app/modules/settings/settings_model.dart';
import "package:flutter/material.dart";
import 'package:get_it/get_it.dart';

class InteracaoWidget extends StatefulWidget {
  @override
  _InteracaoState createState() => _InteracaoState();
}

class _InteracaoState extends State<InteracaoWidget> {
  int groupValueA = 1;
  int resultA = -1;
  int groupValueB = 2;
  int resultB = -1;
  int tempoLimiteVoz = 30;
  int tempoLimiteTeclado = 40;
  int tempoLimiteLocNFC = 10;
  int tempoLimiteLocVoz = 20;
  int tempoLimiteLocTeclado = 30;
  int maximoTentativas = 3;
  bool isConfigProf = false;

  GetIt getIt = GetIt.instance;

  @override
  void initState() {
    Settings currentSettings = getIt<Settings>();
    tempoLimiteTeclado = currentSettings.conhecimento_teclado_tempo;
    tempoLimiteLocTeclado = currentSettings.localizacao_teclado_tempo;

    super.initState();
  }

  void onChangeA(int? value) {
    setState(() {
      if (value != null) {
        groupValueA = value;
        resultA = groupValueA;

        Settings currentSettings = getIt<Settings>();

        currentSettings.conhecimento_is_teclado = false;
        currentSettings.conhecimento_is_voz = false;

        switch (resultA) {
          case 0:
            currentSettings.conhecimento_is_voz = true;
            currentSettings.conhecimento_voz_tempo = tempoLimiteVoz;
            break;
          case 1:
            currentSettings.conhecimento_is_teclado = true;
            currentSettings.conhecimento_teclado_tempo = tempoLimiteTeclado;
            break;
        }
      }
    });
  }

  void onChangeB(int? value) {
    setState(() {
      if (value != null) {
        groupValueB = value;
        resultB = groupValueB;

        Settings currentSettings = getIt<Settings>();

        currentSettings.localizacao_is_voz = false;
        currentSettings.localizacao_is_nfc = false;
        currentSettings.localizacao_is_teclado = false;

        switch (resultB) {
          case 0:
            currentSettings.localizacao_is_nfc = true;
            currentSettings.localizacao_nfc_tempo = tempoLimiteLocNFC;
            break;
          case 1:
            currentSettings.localizacao_is_voz = true;
            currentSettings.localizacao_voz_tempo = tempoLimiteLocVoz;
            break;
          case 1:
            currentSettings.localizacao_is_teclado = true;
            currentSettings.localizacao_teclado_tempo = tempoLimiteLocTeclado;
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            color: Colors.white,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                color: Colors.grey[200],
                child: Text('Interação'),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text('Localização'),
              ),
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: double.infinity,
                    child: Text("Tempo limite",
                        style: TextStyle(
                          color: Colors.blue,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 10.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                                value: 0,
                                groupValue: groupValueB,
                                onChanged: onChangeB),
                            Text('NFC')
                          ],
                        ),
                        Text(tempoLimiteLocNFC.toString())
                      ],
                    ),
                  ),
                  Slider(
                      onChanged: (double value) {
                        setState(() {
                          tempoLimiteLocNFC = value.toInt();
                          Settings currentSettings = getIt<Settings>();
                          currentSettings.localizacao_nfc_tempo =
                              tempoLimiteLocNFC;
                        });
                      },
                      value: tempoLimiteLocNFC.toDouble(),
                      min: 5.0,
                      max: 180.0,
                      divisions: (180 - 5),
                      label: "$tempoLimiteLocNFC"),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 10.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                                value: 1,
                                groupValue: groupValueB,
                                onChanged: onChangeB),
                            Text('Voz')
                          ],
                        ),
                        Text(tempoLimiteLocVoz.toString())
                      ],
                    ),
                  ),
                  Slider(
                      onChanged: (double value) {
                        setState(() {
                          tempoLimiteLocVoz = value.toInt();
                          Settings currentSettings = getIt<Settings>();
                          currentSettings.localizacao_voz_tempo =
                              tempoLimiteLocVoz;
                        });
                      },
                      value: tempoLimiteLocVoz.toDouble(),
                      min: 5.0,
                      max: 180.0,
                      divisions: (180 - 5),
                      label: "$tempoLimiteLocVoz"),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 10.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                                value: 2,
                                groupValue: groupValueB,
                                onChanged: onChangeB),
                            Text('Teclado')
                          ],
                        ),
                        Text(tempoLimiteLocTeclado.toString())
                      ],
                    ),
                  ),
                  Slider(
                      onChanged: (double value) {
                        setState(() {
                          tempoLimiteLocTeclado = value.toInt();
                          Settings currentSettings = getIt<Settings>();
                          currentSettings.localizacao_teclado_tempo =
                              tempoLimiteLocTeclado;

                          print(
                              'tempo conhecimento: ${currentSettings.conhecimento_teclado_tempo}');
                          // 40
                          print(
                              'tempo localização: ${currentSettings.localizacao_teclado_tempo}');
                          // 30
                        });
                      },
                      value: tempoLimiteLocTeclado.toDouble(),
                      min: 5.0,
                      max: 180.0,
                      divisions: (180 - 5),
                      label: "$tempoLimiteLocTeclado")
                ],
              )),
              Divider(thickness: 2.0, color: Colors.grey[200]),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text('Conhecimento'),
              ),
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: double.infinity,
                    child: Text("Tempo limite",
                        style: TextStyle(
                          color: Colors.blue,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 10.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                                value: 0,
                                groupValue: groupValueA,
                                onChanged: onChangeA),
                            Text('Voz')
                          ],
                        ),
                        Text(tempoLimiteVoz.toString())
                      ],
                    ),
                  ),
                  Slider(
                      onChanged: (double value) {
                        setState(() {
                          tempoLimiteVoz = value.toInt();
                          Settings currentSettings = getIt<Settings>();
                          currentSettings.conhecimento_voz_tempo =
                              tempoLimiteVoz;
                        });
                      },
                      value: tempoLimiteVoz.toDouble(),
                      min: 5.0,
                      max: 180.0,
                      divisions: (180 - 5),
                      label: "$tempoLimiteVoz"),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 10.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                                value: 1,
                                groupValue: groupValueA,
                                onChanged: onChangeA),
                            Text('Teclado')
                          ],
                        ),
                        Text(tempoLimiteTeclado.toString())
                      ],
                    ),
                  ),
                  Slider(
                      onChanged: (double value) {
                        setState(() {
                          tempoLimiteTeclado = value.toInt();
                          Settings currentSettings = getIt<Settings>();
                          currentSettings.conhecimento_teclado_tempo =
                              tempoLimiteTeclado;

                          print(
                              'tempo conhecimento: ${currentSettings.conhecimento_teclado_tempo}');
                          // 40
                          print(
                              'tempo localização: ${currentSettings.localizacao_teclado_tempo}');
                          // 30
                        });
                      },
                      value: tempoLimiteTeclado.toDouble(),
                      min: 5.0,
                      max: 180.0,
                      divisions: (180 - 5),
                      label: "$tempoLimiteTeclado")
                ],
              )),
              Divider(thickness: 2.0, color: Colors.grey[200]),
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 10.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Text('Máximo de tentativas')],
                        ),
                        Text(maximoTentativas.toString())
                      ],
                    ),
                  ),
                  Slider(
                      onChanged: (double value) {
                        setState(() {
                          maximoTentativas = value.toInt();
                          Settings currentSettings = getIt<Settings>();
                          currentSettings.max_tentativas = maximoTentativas;
                        });
                      },
                      value: maximoTentativas.toDouble(),
                      min: 1.0,
                      max: 10.0,
                      divisions: (10 - 1),
                      label: "$maximoTentativas"),
                ],
              )),
            ])),
        Container(
            child: Row(children: [
          Checkbox(
              value: isConfigProf,
              onChanged: (bool? val) {
                setState(() {
                  if (val != null) {
                    isConfigProf = val;
                  }
                });
              }),
          Text(" Utilizar configurações do professor")
        ])),
        // ElevatedButton(onPressed: () {
        //   Settings currentSettings = getIt<Settings>();
        //   print(currentSettings);
        // }, child: Text('press'))
      ],
    );
  }
}

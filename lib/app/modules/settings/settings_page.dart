import 'package:app_flutter/app/modules/settings/widgets/apresentacao.dart';
import 'package:app_flutter/app/modules/settings/widgets/entrada.dart';
import 'package:app_flutter/app/modules/settings/widgets/interacao.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  List<Widget> getSettingsGroups () {
    List<Widget> content = [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical : 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Você está em: ',
              style: TextStyle(
                fontWeight: FontWeight.w500
              ),
            ),
            Text(
              'Configurações',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500
              ),
            ) 
          ],
        ),
      ),
      EntradaWidget(),
      SizedBox(height: 10),
      ApresentacaoWidget(),
      SizedBox(height: 10),
      InteracaoWidget()
    ];

    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      body: SingleChildScrollView (
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: getSettingsGroups(),
          ),
        ),
      ),
    );
  }
}

import 'package:app_flutter/app/modules/roteiros/domain/entities/script.dart';
import 'package:app_flutter/app/modules/roteiros/presenter/components/script_card_widget.dart';
import 'package:app_flutter/app/modules/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../app_store.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  AppStore appStore = Modular.get<AppStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Anatome App'),
        actions: [
          IconButton(
            icon: Icon(Icons.lightbulb_outline),
            onPressed: () {
              appStore.switchTheme();
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            },
          )
        ],
      ),
      body: ScopedBuilder<HomeStore, Exception, int>(
        store: store,
        onState: (_, counter) => AnatomeHome(),
      ),
    );
  }
}

class AnatomeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 28, bottom: 5),
          child: Text(
            'Você está em roteiros',
            style: TextStyle(fontSize: 30, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 200),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ScriptCardWidget(
                script: Script(
                  name: 'Sistema esquelético',
                  discipline: 'Biomedicina',
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

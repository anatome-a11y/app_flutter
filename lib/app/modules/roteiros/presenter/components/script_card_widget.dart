import 'package:app_flutter/app/modules/roteiros/domain/entities/script.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ScriptCardWidget extends StatelessWidget {
  final Script script;

  const ScriptCardWidget({Key? key, required this.script}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/scripts');
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              title: Text(script.name),
              subtitle: Text(
                script.discipline,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Text(
            //     'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
            //     style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

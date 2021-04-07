import 'package:app_flutter/app/modules/roteiros/domain/entities/script.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ScriptCardWidget extends StatelessWidget {
  final Script script;

  const ScriptCardWidget({Key? key, required this.script}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.book),
      title: Text(script.name),
      subtitle: Text(script.discipline),
      onTap: () {
        Modular.to.pushNamed('/scripts');
      },
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Modular.to.pushNamed('/scripts');
          },
          child: Container(
            child: Column(
              children: [
                ListTile(
                  title: Text(script.name),
                  subtitle: Text(
                    script.discipline,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

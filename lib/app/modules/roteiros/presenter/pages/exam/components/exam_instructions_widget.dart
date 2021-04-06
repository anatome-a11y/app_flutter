import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_mode.dart';
import 'package:app_flutter/app/modules/settings/settings_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../../main.dart';

class ExamInstructionsWidget extends StatelessWidget {
  final ExamMode mode;
  final Function() onInitExam;

  const ExamInstructionsWidget(
      {Key? key, required this.onInitExam, required this.mode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: _content(),
            ),
          ),
        );
      },
    );
  }

  Widget _content() {
    Settings currentSettings = getIt<Settings>();
    final totalTime = mode.isToFind == true
        ? currentSettings.localizacao_teclado_tempo
        : currentSettings.conhecimento_teclado_tempo;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 16),
                  title: Text(
                    'Instruções',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    mode.getText() + '\n\n tempo: $totalTime',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(child: Container()),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(14),
          child: ElevatedButton(
            child: Container(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text(
                  'Iniciar exame',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            onPressed: onInitExam,
          ),
        ),
      ],
    );
  }
}

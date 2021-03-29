import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_mode.dart';
import 'package:flutter/material.dart';

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
                    getText(),
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

  String getText() {
    if (mode.isTheoretical && mode.isToFind)
      return '''Para cada conteúdo teórico informe a parte correspondente.

Utilize as setas para alternar as questões, a avaliação é concluída quando todas as questões forem respondidas e clicar em “finalizar”.

Gerencie bem o seu tempo e boa prova.''';

    if (mode.isTheoretical && !mode.isToFind)
      return '''Dada a localização de cada parte, informe o seu nome e seus respectivos conteúdos teóricos.

Utilize as setas para alternar as questões, a avaliação é concluída quando todas as questões forem respondidas e clicar em “finalizar”.

Gerencie bem o seu tempo e boa prova.''';

    if (!mode.isTheoretical && mode.isToFind)
      return '''Informe as partes de cada peça física do roteiro.

Utilize as setas para alternar as questões, a avaliação é concluída quando todas as questões forem respondidas e clicar em “finalizar”.

Gerencie bem o seu tempo e boa prova.''';

    if (!mode.isTheoretical && !mode.isToFind)
      return '''Para cada parte (isto é, sua localização) de cada peça física, escreva o nome da parte em questão.

Utilize as setas para alternar as questões, a avaliação é concluída quando todas as questões forem respondidas e clicar em “finalizar”.

Gerencie bem o seu tempo e boa prova.''';

    return '';
  }
}

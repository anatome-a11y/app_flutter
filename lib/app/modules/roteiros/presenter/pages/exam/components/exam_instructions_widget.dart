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
      return '''

      Para cada parte (isto é, sua localização) em cada 
      peça física, selecione o nome da parte e em 
      seguida clique en \"Próximo\" para submeter
      
      Utilize o campo "Nome da Parte" para buscar a 
      parte desejada.

      Você poderá retornar nas questões onde surgirem
      dúvidas e se preciso alterar sua resposta.

      A avaliação é concluída quando responder todas 
      as questões e clicar em "Submeter resposta".

      ''';

    if (mode.isTheoretical && !mode.isToFind)
      return '''
      
      Informe as partes de cada peça física do 
      roteiro e pressione o botão "próximo" para
      submeter.

      Você poderá retornar nas questões onde surgirem
      dúvidas e se preciso alterar sua resposta.

      A avaliação é concluída quando responder todas 
      as questões e clicar em "Submeter resposta".
      
      ''';


    if (!mode.isTheoretical && mode.isToFind)
        return '''
      
      Para cada conteúdo teórico informe a parte
      correspondente e em seguida pressione o
      botão "pŕoximo" para salvar.

      Você poderá retornar nas questões onde surgirem 
      dúvidas e se preciso alterar sua resposta.

      A avaliação é concluída quando responder todas 
      as questões e clicar em "Submeter resposta"

      ''';

    if (!mode.isTheoretical && !mode.isToFind)
      return '''
      
      Dada a localização de cada parte, informe o seu 
      nome e seus respectivos conteúdos teóricos

      Após informar esses dados, clique em "salvar
      resposta"

      Você poderá retornar nas questões onde surgirem 
      dúvidas e se preciso alterar sua resposta.

      A avaliação é concluída quando responder todas
      as questões e clicar em "Submeter resposta".

      ''';
      

    return '''Outros...''';
  }
}

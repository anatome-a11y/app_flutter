class ExamMode {
  final bool isTheoretical;
  final bool isToFind;

  ExamMode({required this.isTheoretical, required this.isToFind});

  String getText() {
    if (isTheoretical && isToFind)
      return '''1. Para cada conteúdo teórico informe a parte correspondente.
2. Para alternar as questões utilize as setas ou pode clicar diretamente no ícone da questão que desejar.
3. Após responder todas as questões, finalize sua avaliação clicando no botão “finalizar”.
4. Pode iniciar sua avaliação clicando no botão “Iniciar exame”.
5. Gerencie bem o seu tempo e boa prova.''';

    if (isTheoretical && !isToFind)
      return '''1. Dada a localização de cada parte, informe o seu nome e seus respectivos conteúdos teóricos.
2. Para alternar as questões utilize as setas ou pode clicar diretamente no ícone da questão que desejar.
3. Após responder todas as questões, finalize sua avaliação clicando no botão “finalizar”.
4. Pode iniciar sua avaliação clicando no botão “Iniciar exame”.
5. Gerencie bem o seu tempo e boa prova.''';

    if (!isTheoretical && isToFind)
      return '''1. Informe as partes de cada peça física do roteiro.
2. Para alternar as questões utilize as setas ou pode clicar diretamente no ícone da questão que desejar.
3. Após responder todas as questões, finalize sua avaliação clicando no botão “finalizar”.
4. Pode iniciar sua avaliação clicando no botão “Iniciar exame”.
5. Gerencie bem o seu tempo e boa prova.''';

    if (!isTheoretical && !isToFind)
      return '''1. Para cada parte (isto é, sua localização) de cada peça física, escreva o nome da parte em questão.
2. Para alternar as questões utilize as setas ou pode clicar diretamente no ícone da questão que desejar.
3. Após responder todas as questões, finalize sua avaliação clicando no botão “finalizar”.
4. Pode iniciar sua avaliação clicando no botão “Iniciar exame”.
5. Gerencie bem o seu tempo e boa prova.''';

    return '';
  }
}

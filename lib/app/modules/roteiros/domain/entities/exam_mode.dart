class ExamMode {
  final bool isTheoretical;
  final bool isToFind;

  ExamMode({required this.isTheoretical, required this.isToFind});

  String getText() {
    if (isTheoretical && isToFind)
      return '''Para cada conteúdo teórico informe a parte correspondente.

Utilize as setas para alternar as questões, a avaliação é concluída quando todas as questões forem respondidas e clicar em “finalizar”.

Gerencie bem o seu tempo e boa prova.''';

    if (isTheoretical && !isToFind)
      return '''Dada a localização de cada parte, informe o seu nome e seus respectivos conteúdos teóricos.

Utilize as setas para alternar as questões, a avaliação é concluída quando todas as questões forem respondidas e clicar em “finalizar”.

Gerencie bem o seu tempo e boa prova.''';

    if (!isTheoretical && isToFind)
      return '''Informe as partes de cada peça física do roteiro.

Utilize as setas para alternar as questões, a avaliação é concluída quando todas as questões forem respondidas e clicar em “finalizar”.

Gerencie bem o seu tempo e boa prova.''';

    if (!isTheoretical && !isToFind)
      return '''Para cada parte (isto é, sua localização) de cada peça física, escreva o nome da parte em questão.

Utilize as setas para alternar as questões, a avaliação é concluída quando todas as questões forem respondidas e clicar em “finalizar”.

Gerencie bem o seu tempo e boa prova.''';

    return '';
  }
}

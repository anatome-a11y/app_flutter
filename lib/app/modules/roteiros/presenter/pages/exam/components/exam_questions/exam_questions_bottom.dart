import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  final Exam exam;
  final int currentQuestionIndex;
  final int remainingTime;

  const Bottom({
    Key? key,
    required this.exam,
    required this.currentQuestionIndex,
    required this.remainingTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: SingleChildScrollView(
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(left: 16),
                title: Text(
                  'Resumo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Divider(),
              _cardContent()
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: _section(
              'Etapa',
              '${currentQuestionIndex + 1} / ${exam.questions.length}',
            ),
          ),
          Expanded(
            child: _section(
              'Tempo',
              '$remainingTime',
            ),
          )
        ],
      ),
    );
  }

  Widget _section(String title, String content) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        _board(content)
      ],
    );
  }

  Widget _board(String content) {
    return Card(
      color: Colors.grey.shade800,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          content,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

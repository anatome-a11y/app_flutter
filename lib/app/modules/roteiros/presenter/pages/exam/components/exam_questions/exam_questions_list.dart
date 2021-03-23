import 'dart:async';

import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_mode.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class QuestionsList extends StatelessWidget {
  final Exam exam;
  final int currentQuestionIndex;
  final Function(int index) onSelect;

  QuestionsList(
      {Key? key,
      required this.exam,
      required this.currentQuestionIndex,
      required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 12,
      itemBuilder: (context, index) {
        return Card(
          color: currentQuestionIndex == index ? Colors.black45 : Colors.white,
          child: InkWell(
            onTap: () {
              onSelect(index);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                '${index + 1}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: currentQuestionIndex == index
                      ? Colors.white
                      : Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

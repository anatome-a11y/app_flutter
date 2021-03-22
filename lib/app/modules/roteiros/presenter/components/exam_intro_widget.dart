import 'package:app_flutter/app/modules/roteiros/domain/entities/anatomy_part_relation.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:app_flutter/app/modules/roteiros/domain/entities/question.dart';
import 'package:flutter/material.dart';

class ExamIntroWidget extends StatelessWidget {
  final Exam exam;
  const ExamIntroWidget({Key? key, required this.exam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text(
        //   exam.message,
        //   style: TextStyle(fontSize: 40),
        // ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 300),
          child: ListView.builder(
            itemCount: exam.questions.length,
            itemBuilder: (_, index) {
              final Question question = exam.questions[index];
              final List<AnatomyPartRelation> relations =
                  question.part.partRelations;

              return Column(
                children: [
                  Text(question.part.name, style: TextStyle(fontSize: 25)),
                  Column(
                    children: relations
                        .map(
                          (relation) => Text(
                            relation.relatedPart.name,
                          ),
                        )
                        .toList(),
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

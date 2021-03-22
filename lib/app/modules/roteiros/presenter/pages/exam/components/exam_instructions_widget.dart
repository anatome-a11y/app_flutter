import 'package:flutter/material.dart';

class ExamInstructionsWidget extends StatelessWidget {
  final Function() onInitExam;

  const ExamInstructionsWidget({Key? key, required this.onInitExam})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Instruções',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Divider(),
              Text('......')
            ],
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
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

import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:flutter/material.dart';

class ControlButtons extends StatelessWidget {
  final Exam exam;
  final Function() onPrev;
  final Function() onNext;
  final Function() onFinish;

  const ControlButtons({
    Key? key,
    required this.exam,
    required this.onPrev,
    required this.onNext,
    required this.onFinish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: onPrev,
            child: Container(
              height: 50,
              child: Center(
                child: Icon(Icons.arrow_back),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 3,
          child: ElevatedButton(
            onPressed: onFinish,
            child: Container(
              height: 50,
              child: Center(
                child: Text("Finalizar"),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: onNext,
            child: Container(
              height: 50,
              child: Center(
                child: Icon(Icons.arrow_forward),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

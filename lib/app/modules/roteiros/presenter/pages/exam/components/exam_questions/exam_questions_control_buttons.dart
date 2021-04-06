import 'package:app_flutter/app/modules/roteiros/domain/entities/exam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../exam_state.dart';
import '../../exam_store.dart';

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

  void showOnConfirmFinish() {
    print('request user to confirm exam finish');

    //onFinish();
  }

  @override
  Widget build(BuildContext context) {
    ExamStore examStore = Modular.get<ExamStore>();
    final examState = examStore.state as ExamContentState;

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
            onPressed: examState.examInitied ? onFinish : showOnConfirmFinish,
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

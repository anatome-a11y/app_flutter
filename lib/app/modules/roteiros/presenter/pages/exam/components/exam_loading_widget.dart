import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ExamLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      // baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[300]!,
      enabled: true,
      child: ExamLoadingShapeWidget(),
    );
  }
}

class ExamLoadingShapeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          _Body(),
          const SizedBox(
            height: 20,
          ),
          _ControlButtons(),
          const SizedBox(
            height: 20,
          ),
          _Bottom(),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 50),
            child: _QuestionsList(),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class _QuestionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}

class _ControlButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 50,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class _Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.white,
    );
  }
}

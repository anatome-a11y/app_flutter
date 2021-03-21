import 'package:flutter/material.dart';

import 'components/exam_widget.dart';

class ExamPage extends StatefulWidget {
  final String title;
  const ExamPage({Key? key, this.title = "Avaliação"}) : super(key: key);
  @override
  ExamPageState createState() => ExamPageState();
}

class ExamPageState extends State<ExamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ExamWidget(),
    );
  }
}

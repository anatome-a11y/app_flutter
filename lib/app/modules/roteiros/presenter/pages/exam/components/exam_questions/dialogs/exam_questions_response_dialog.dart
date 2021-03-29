import 'package:app_flutter/app/modules/roteiros/domain/entities/exam_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExamQuestionResponseDialog extends StatefulWidget {
  final ExamMode mode;
  final List<String>? responses;

  ExamQuestionResponseDialog({
    Key? key,
    required this.mode,
    required this.responses,
  }) : super(key: key);

  @override
  _ExamQuestionResponseDialogState createState() =>
      _ExamQuestionResponseDialogState();
}

class _ExamQuestionResponseDialogState
    extends State<ExamQuestionResponseDialog> {
  late TextEditingController _field1Response;
  late TextEditingController _field2Response;

  @override
  void initState() {
    initFields();
    super.initState();
  }

  void initFields() {
    final responses = widget.responses;

    if (responses == null) {
      _field1Response = TextEditingController(text: '');
      _field2Response = TextEditingController(text: '');
      return;
    }

    _field1Response = TextEditingController(text: responses[0]);

    if (responses.length == 2) {
      _field2Response = TextEditingController(text: responses[1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    String text = 'Nome da parte';
    TextInputType keyboardType = TextInputType.text;
    List<TextInputFormatter> inputFormatters = [];

    if (widget.mode.isToFind) {
      text = 'Número da parte';
      keyboardType = TextInputType.number;
      inputFormatters = [FilteringTextInputFormatter.digitsOnly];
    }

    TextInputAction firstTextInputAction = TextInputAction.go;
    Function(String)? firstTextInputSubmitFn = (value) => _submit(context);

    if (widget.mode.isTheoretical && !widget.mode.isToFind) {
      firstTextInputAction = TextInputAction.next;
      firstTextInputSubmitFn = null;
    }

    return WillPopScope(
      onWillPop: () async {
        _submit(context);
        return true;
      },
      child: AlertDialog(
        title: Text('Escreva sua resposta.'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextField(
                  keyboardType: keyboardType,
                  textInputAction: firstTextInputAction,
                  inputFormatters: inputFormatters,
                  maxLines: 1,
                  autofocus: true,
                  controller: _field1Response,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: text,
                  ),
                  onSubmitted: firstTextInputSubmitFn,
                ),
              ),
              if (widget.mode.isTheoretical && !widget.mode.isToFind)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        minLines: 2,
                        maxLines: null,
                        controller: _field2Response,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Conteúdos teóricos',
                        ),
                      ),
                    ),
                    Text('(Digite um conteúdo teórico por linha)')
                  ],
                ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('CONFIRMAR'),
            onPressed: () => _submit(context),
          ),
        ],
      ),
    );
  }

  _submit(context) {
    List<String> responses = [_field1Response.text];

    if (widget.mode.isTheoretical && !widget.mode.isToFind) {
      responses.add(_field2Response.text);
    }

    Navigator.of(context).pop(responses);
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:app_flutter/app/modules/roteiros/presenter/pages/exam/exam_store.dart';
 
void main() {
  late ExamStore store;

  setUpAll(() {
    store = ExamStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}
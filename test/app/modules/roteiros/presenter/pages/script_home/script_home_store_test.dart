import 'package:flutter_test/flutter_test.dart';
import 'package:app_flutter/app/modules/roteiros/presenter/pages/script_home/script_home_store.dart';

void main() {
  late ScriptHomeStore store;

  setUpAll(() {
    store = ScriptHomeStore();
  });

  test('increment count', () async {
    // expect(store.state, equals(0));
    // store.update(store.state + 1);
    // expect(store.state, equals(1));
  });
}

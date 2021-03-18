import 'package:flutter_triple/flutter_triple.dart';

class HomeStore extends NotifierStore<Exception, int> {
  HomeStore() : super(0);

  Future<void> increment() async {
    setLoading(true);

    await Future.delayed(Duration(milliseconds: 200));

    int value = state + 1;

    if (value < 10) {
      update(value);
    } else {
      setError(Exception('Error: state not can be > 4'));
    }

    setLoading(false);
  }

  restart() {
    update(0);
  }
}

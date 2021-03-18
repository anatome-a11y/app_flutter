import 'package:flutter_triple/flutter_triple.dart';
import 'app_viewmodel.dart';

class AppStore extends NotifierStore<Exception, AppViewModel> {
  AppStore()
      : super(
          AppViewModel(isDarkTheme: false),
        );

  void changeTheme({required bool isDarkTheme}) {
    update(
      AppViewModel(isDarkTheme: isDarkTheme),
    );
  }
}

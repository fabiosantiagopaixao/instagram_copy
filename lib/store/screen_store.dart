import 'package:instagram_copy/models/contants.dart';
import "package:mobx/mobx.dart";

part "screen_store.g.dart";

class ScreenStore = _ScreenStore with _$ScreenStore;

abstract class _ScreenStore with Store {

  @observable
  int selectedScreen = Constants.FEED;

  @action
  void changeScreen(int screenIndex) {
    selectedScreen = screenIndex;
  }
}




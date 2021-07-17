// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScreenStore on _ScreenStore, Store {
  final _$selectedScreenAtom = Atom(name: '_ScreenStore.selectedScreen');

  @override
  int get selectedScreen {
    _$selectedScreenAtom.reportRead();
    return super.selectedScreen;
  }

  @override
  set selectedScreen(int value) {
    _$selectedScreenAtom.reportWrite(value, super.selectedScreen, () {
      super.selectedScreen = value;
    });
  }

  final _$_ScreenStoreActionController = ActionController(name: '_ScreenStore');

  @override
  void changeScreen(int screenIndex) {
    final _$actionInfo = _$_ScreenStoreActionController.startAction(
        name: '_ScreenStore.changeScreen');
    try {
      return super.changeScreen(screenIndex);
    } finally {
      _$_ScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedScreen: ${selectedScreen}
    ''';
  }
}

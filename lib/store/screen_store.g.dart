// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScreenStore on _ScreenStore, Store {
  final _$profileAtom = Atom(name: '_ScreenStore.profile');

  @override
  Profile get profile {
    _$profileAtom.reportRead();
    return super.profile;
  }

  @override
  set profile(Profile value) {
    _$profileAtom.reportWrite(value, super.profile, () {
      super.profile = value;
    });
  }

  final _$currentStateAtom = Atom(name: '_ScreenStore.currentState');

  @override
  ScreenMode get currentState {
    _$currentStateAtom.reportRead();
    return super.currentState;
  }

  @override
  set currentState(ScreenMode value) {
    _$currentStateAtom.reportWrite(value, super.currentState, () {
      super.currentState = value;
    });
  }

  @override
  String toString() {
    return '''
profile: ${profile},
currentState: ${currentState}
    ''';
  }
}

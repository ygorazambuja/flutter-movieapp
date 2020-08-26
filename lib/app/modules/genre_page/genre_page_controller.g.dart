// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GenrePageController on _GenrePageControllerBase, Store {
  final _$valueAtom = Atom(name: '_GenrePageControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_GenrePageControllerBaseActionController =
      ActionController(name: '_GenrePageControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_GenrePageControllerBaseActionController.startAction(
        name: '_GenrePageControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_GenrePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}

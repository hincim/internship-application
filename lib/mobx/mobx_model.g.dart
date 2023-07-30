// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobxModel on MobxModelBase, Store {
  late final _$refreshAtom =
      Atom(name: 'RefreshModelBase.refresh', context: context);

  @override
  bool get refresh {
    _$refreshAtom.reportRead();
    return super.refresh;
  }

  @override
  set refresh(bool value) {
    _$refreshAtom.reportWrite(value, super.refresh, () {
      super.refresh = value;
    });
  }

  late final _$RefreshModelBaseActionController =
      ActionController(name: 'RefreshModelBase', context: context);

  @override
  void refreshTrue() {
    final _$actionInfo = _$RefreshModelBaseActionController.startAction(
        name: 'RefreshModelBase.refreshTrue');
    try {
      return super.refreshTrue();
    } finally {
      _$RefreshModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void refreshFalse() {
    final _$actionInfo = _$RefreshModelBaseActionController.startAction(
        name: 'RefreshModelBase.refreshFalse');
    try {
      return super.refreshFalse();
    } finally {
      _$RefreshModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
refresh: ${refresh}
    ''';
  }
}

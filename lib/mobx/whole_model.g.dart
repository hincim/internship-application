// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whole_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WholeModel on WholeModelBase, Store {
  late final _$tabsIndexAtom =
      Atom(name: 'WholeModelBase.tabsIndex', context: context);

  @override
  int get tabsIndex {
    _$tabsIndexAtom.reportRead();
    return super.tabsIndex;
  }

  @override
  set tabsIndex(int value) {
    _$tabsIndexAtom.reportWrite(value, super.tabsIndex, () {
      super.tabsIndex = value;
    });
  }

  late final _$refreshStateAtom =
      Atom(name: 'WholeModelBase.refreshState', context: context);

  @override
  bool get refreshState {
    _$refreshStateAtom.reportRead();
    return super.refreshState;
  }

  @override
  set refreshState(bool value) {
    _$refreshStateAtom.reportWrite(value, super.refreshState, () {
      super.refreshState = value;
    });
  }

  late final _$iconStateAtom =
      Atom(name: 'WholeModelBase.iconState', context: context);

  @override
  bool get iconState {
    _$iconStateAtom.reportRead();
    return super.iconState;
  }

  @override
  set iconState(bool value) {
    _$iconStateAtom.reportWrite(value, super.iconState, () {
      super.iconState = value;
    });
  }

  late final _$initialValueAtom =
      Atom(name: 'WholeModelBase.initialValue', context: context);

  @override
  int get initialValue {
    _$initialValueAtom.reportRead();
    return super.initialValue;
  }

  @override
  set initialValue(int value) {
    _$initialValueAtom.reportWrite(value, super.initialValue, () {
      super.initialValue = value;
    });
  }

  late final _$langOptionStateAtom =
      Atom(name: 'WholeModelBase.langOptionState', context: context);

  @override
  bool get langOptionState {
    _$langOptionStateAtom.reportRead();
    return super.langOptionState;
  }

  @override
  set langOptionState(bool value) {
    _$langOptionStateAtom.reportWrite(value, super.langOptionState, () {
      super.langOptionState = value;
    });
  }

  late final _$registerPagePswAtom =
      Atom(name: 'WholeModelBase.registerPagePsw', context: context);

  @override
  bool get registerPagePsw {
    _$registerPagePswAtom.reportRead();
    return super.registerPagePsw;
  }

  @override
  set registerPagePsw(bool value) {
    _$registerPagePswAtom.reportWrite(value, super.registerPagePsw, () {
      super.registerPagePsw = value;
    });
  }

  late final _$registerPagePswAgainAtom =
      Atom(name: 'WholeModelBase.registerPagePswAgain', context: context);

  @override
  bool get registerPagePswAgain {
    _$registerPagePswAgainAtom.reportRead();
    return super.registerPagePswAgain;
  }

  @override
  set registerPagePswAgain(bool value) {
    _$registerPagePswAgainAtom.reportWrite(value, super.registerPagePswAgain,
        () {
      super.registerPagePswAgain = value;
    });
  }

  late final _$checkBoxOneAtom =
      Atom(name: 'WholeModelBase.checkBoxOne', context: context);

  @override
  bool get checkBoxOne {
    _$checkBoxOneAtom.reportRead();
    return super.checkBoxOne;
  }

  @override
  set checkBoxOne(bool value) {
    _$checkBoxOneAtom.reportWrite(value, super.checkBoxOne, () {
      super.checkBoxOne = value;
    });
  }

  late final _$checkBoxTwoAtom =
      Atom(name: 'WholeModelBase.checkBoxTwo', context: context);

  @override
  bool get checkBoxTwo {
    _$checkBoxTwoAtom.reportRead();
    return super.checkBoxTwo;
  }

  @override
  set checkBoxTwo(bool value) {
    _$checkBoxTwoAtom.reportWrite(value, super.checkBoxTwo, () {
      super.checkBoxTwo = value;
    });
  }

  late final _$versionAtom =
      Atom(name: 'WholeModelBase.version', context: context);

  @override
  String get version {
    _$versionAtom.reportRead();
    return super.version;
  }

  @override
  set version(String value) {
    _$versionAtom.reportWrite(value, super.version, () {
      super.version = value;
    });
  }

  late final _$appBarControlAtom =
      Atom(name: 'WholeModelBase.appBarControl', context: context);

  @override
  bool get appBarControl {
    _$appBarControlAtom.reportRead();
    return super.appBarControl;
  }

  @override
  set appBarControl(bool value) {
    _$appBarControlAtom.reportWrite(value, super.appBarControl, () {
      super.appBarControl = value;
    });
  }

  late final _$cityAtom = Atom(name: 'WholeModelBase.city', context: context);

  @override
  String get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  late final _$WholeModelBaseActionController =
      ActionController(name: 'WholeModelBase', context: context);

  @override
  void appBarControlled() {
    final _$actionInfo = _$WholeModelBaseActionController.startAction(
        name: 'WholeModelBase.appBarControlled');
    try {
      return super.appBarControlled();
    } finally {
      _$WholeModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchWord(String city) {
    final _$actionInfo = _$WholeModelBaseActionController.startAction(
        name: 'WholeModelBase.searchWord');
    try {
      return super.searchWord(city);
    } finally {
      _$WholeModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleTabChange(TabController tabController) {
    final _$actionInfo = _$WholeModelBaseActionController.startAction(
        name: 'WholeModelBase.handleTabChange');
    try {
      return super.handleTabChange(tabController);
    } finally {
      _$WholeModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void iconStateChanged() {
    final _$actionInfo = _$WholeModelBaseActionController.startAction(
        name: 'WholeModelBase.iconStateChanged');
    try {
      return super.iconStateChanged();
    } finally {
      _$WholeModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void langOption(bool? value) {
    final _$actionInfo = _$WholeModelBaseActionController.startAction(
        name: 'WholeModelBase.langOption');
    try {
      return super.langOption(value);
    } finally {
      _$WholeModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void refresh(bool? value) {
    final _$actionInfo = _$WholeModelBaseActionController.startAction(
        name: 'WholeModelBase.refresh');
    try {
      return super.refresh(value);
    } finally {
      _$WholeModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initialValueChanged(int value) {
    final _$actionInfo = _$WholeModelBaseActionController.startAction(
        name: 'WholeModelBase.initialValueChanged');
    try {
      return super.initialValueChanged(value);
    } finally {
      _$WholeModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void registerPagePswChanged(int i) {
    final _$actionInfo = _$WholeModelBaseActionController.startAction(
        name: 'WholeModelBase.registerPagePswChanged');
    try {
      return super.registerPagePswChanged(i);
    } finally {
      _$WholeModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkBoxChanged(int i) {
    final _$actionInfo = _$WholeModelBaseActionController.startAction(
        name: 'WholeModelBase.checkBoxChanged');
    try {
      return super.checkBoxChanged(i);
    } finally {
      _$WholeModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tabsIndex: ${tabsIndex},
refreshState: ${refreshState},
iconState: ${iconState},
initialValue: ${initialValue},
langOptionState: ${langOptionState},
registerPagePsw: ${registerPagePsw},
registerPagePswAgain: ${registerPagePswAgain},
checkBoxOne: ${checkBoxOne},
checkBoxTwo: ${checkBoxTwo},
version: ${version},
appBarControl: ${appBarControl},
city: ${city}
    ''';
  }
}

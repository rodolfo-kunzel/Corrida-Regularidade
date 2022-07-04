// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StopRegisterController on _StopRegisterControllerBase, Store {
  Computed<bool>? _$allInputsValidComputed;

  @override
  bool get allInputsValid =>
      (_$allInputsValidComputed ??= Computed<bool>(() => super.allInputsValid,
              name: '_StopRegisterControllerBase.allInputsValid'))
          .value;
  Computed<bool>? _$isStartComputed;

  @override
  bool get isStart => (_$isStartComputed ??= Computed<bool>(() => super.isStart,
          name: '_StopRegisterControllerBase.isStart'))
      .value;

  late final _$stopNameAtom =
      Atom(name: '_StopRegisterControllerBase.stopName', context: context);

  @override
  String get stopName {
    _$stopNameAtom.reportRead();
    return super.stopName;
  }

  @override
  set stopName(String value) {
    _$stopNameAtom.reportWrite(value, super.stopName, () {
      super.stopName = value;
    });
  }

  late final _$minutesSinceStartAtom = Atom(
      name: '_StopRegisterControllerBase.minutesSinceStart', context: context);

  @override
  String get minutesSinceStart {
    _$minutesSinceStartAtom.reportRead();
    return super.minutesSinceStart;
  }

  @override
  set minutesSinceStart(String value) {
    _$minutesSinceStartAtom.reportWrite(value, super.minutesSinceStart, () {
      super.minutesSinceStart = value;
    });
  }

  late final _$dropDownValueAtom =
      Atom(name: '_StopRegisterControllerBase.dropDownValue', context: context);

  @override
  String get dropDownValue {
    _$dropDownValueAtom.reportRead();
    return super.dropDownValue;
  }

  @override
  set dropDownValue(String value) {
    _$dropDownValueAtom.reportWrite(value, super.dropDownValue, () {
      super.dropDownValue = value;
    });
  }

  late final _$stopRegisterAsyncAction =
      AsyncAction('_StopRegisterControllerBase.stopRegister', context: context);

  @override
  Future<void> stopRegister() {
    return _$stopRegisterAsyncAction.run(() => super.stopRegister());
  }

  late final _$_StopRegisterControllerBaseActionController =
      ActionController(name: '_StopRegisterControllerBase', context: context);

  @override
  void changeStopName(String newValue) {
    final _$actionInfo = _$_StopRegisterControllerBaseActionController
        .startAction(name: '_StopRegisterControllerBase.changeStopName');
    try {
      return super.changeStopName(newValue);
    } finally {
      _$_StopRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeMinutesSinceStart(String newValue) {
    final _$actionInfo =
        _$_StopRegisterControllerBaseActionController.startAction(
            name: '_StopRegisterControllerBase.changeMinutesSinceStart');
    try {
      return super.changeMinutesSinceStart(newValue);
    } finally {
      _$_StopRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDropDownValue(dynamic newValue) {
    final _$actionInfo = _$_StopRegisterControllerBaseActionController
        .startAction(name: '_StopRegisterControllerBase.changeDropDownValue');
    try {
      return super.changeDropDownValue(newValue);
    } finally {
      _$_StopRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stopName: ${stopName},
minutesSinceStart: ${minutesSinceStart},
dropDownValue: ${dropDownValue},
allInputsValid: ${allInputsValid},
isStart: ${isStart}
    ''';
  }
}

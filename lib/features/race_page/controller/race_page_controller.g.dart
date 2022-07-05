// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RacePageController on _RacePageControllerBase, Store {
  Computed<bool>? _$allInputsValidComputed;

  @override
  bool get allInputsValid =>
      (_$allInputsValidComputed ??= Computed<bool>(() => super.allInputsValid,
              name: '_RacePageControllerBase.allInputsValid'))
          .value;

  late final _$currentStopAtom =
      Atom(name: '_RacePageControllerBase.currentStop', context: context);

  @override
  String get currentStop {
    _$currentStopAtom.reportRead();
    return super.currentStop;
  }

  @override
  set currentStop(String value) {
    _$currentStopAtom.reportWrite(value, super.currentStop, () {
      super.currentStop = value;
    });
  }

  late final _$currentCarAtom =
      Atom(name: '_RacePageControllerBase.currentCar', context: context);

  @override
  String get currentCar {
    _$currentCarAtom.reportRead();
    return super.currentCar;
  }

  @override
  set currentCar(String value) {
    _$currentCarAtom.reportWrite(value, super.currentCar, () {
      super.currentCar = value;
    });
  }

  late final _$timeAtom =
      Atom(name: '_RacePageControllerBase.time', context: context);

  @override
  TimeOfDay get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(TimeOfDay value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  late final _$allStopsAtom =
      Atom(name: '_RacePageControllerBase.allStops', context: context);

  @override
  List<String> get allStops {
    _$allStopsAtom.reportRead();
    return super.allStops;
  }

  @override
  set allStops(List<String> value) {
    _$allStopsAtom.reportWrite(value, super.allStops, () {
      super.allStops = value;
    });
  }

  late final _$allCarsAtom =
      Atom(name: '_RacePageControllerBase.allCars', context: context);

  @override
  List<String> get allCars {
    _$allCarsAtom.reportRead();
    return super.allCars;
  }

  @override
  set allCars(List<String> value) {
    _$allCarsAtom.reportWrite(value, super.allCars, () {
      super.allCars = value;
    });
  }

  late final _$displayTimeDialogAsyncAction = AsyncAction(
      '_RacePageControllerBase.displayTimeDialog',
      context: context);

  @override
  Future<void> displayTimeDialog(dynamic context) {
    return _$displayTimeDialogAsyncAction
        .run(() => super.displayTimeDialog(context));
  }

  late final _$allStopNamesAsyncAction =
      AsyncAction('_RacePageControllerBase.allStopNames', context: context);

  @override
  Future<void> allStopNames() {
    return _$allStopNamesAsyncAction.run(() => super.allStopNames());
  }

  late final _$allCarNamesAsyncAction =
      AsyncAction('_RacePageControllerBase.allCarNames', context: context);

  @override
  Future<void> allCarNames() {
    return _$allCarNamesAsyncAction.run(() => super.allCarNames());
  }

  late final _$stopCarTimeRegisterAsyncAction = AsyncAction(
      '_RacePageControllerBase.stopCarTimeRegister',
      context: context);

  @override
  Future<void> stopCarTimeRegister() {
    return _$stopCarTimeRegisterAsyncAction
        .run(() => super.stopCarTimeRegister());
  }

  late final _$_RacePageControllerBaseActionController =
      ActionController(name: '_RacePageControllerBase', context: context);

  @override
  void changeCarPassedThroughtTime(TimeOfDay newValue) {
    final _$actionInfo = _$_RacePageControllerBaseActionController.startAction(
        name: '_RacePageControllerBase.changeCarPassedThroughtTime');
    try {
      return super.changeCarPassedThroughtTime(newValue);
    } finally {
      _$_RacePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCurrentStop(dynamic newValue) {
    final _$actionInfo = _$_RacePageControllerBaseActionController.startAction(
        name: '_RacePageControllerBase.changeCurrentStop');
    try {
      return super.changeCurrentStop(newValue);
    } finally {
      _$_RacePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCurrentCar(dynamic newValue) {
    final _$actionInfo = _$_RacePageControllerBaseActionController.startAction(
        name: '_RacePageControllerBase.changeCurrentCar');
    try {
      return super.changeCurrentCar(newValue);
    } finally {
      _$_RacePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentStop: ${currentStop},
currentCar: ${currentCar},
time: ${time},
allStops: ${allStops},
allCars: ${allCars},
allInputsValid: ${allInputsValid}
    ''';
  }
}

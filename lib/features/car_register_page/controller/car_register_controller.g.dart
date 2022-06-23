// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CarRegisterController on _CarRegisterControllerBase, Store {
  Computed<bool>? _$isCarNumberValidComputed;

  @override
  bool get isCarNumberValid => (_$isCarNumberValidComputed ??= Computed<bool>(
          () => super.isCarNumberValid,
          name: '_CarRegisterControllerBase.isCarNumberValid'))
      .value;
  Computed<bool>? _$isCompetitionNameValidComputed;

  @override
  bool get isCompetitionNameValid => (_$isCompetitionNameValidComputed ??=
          Computed<bool>(() => super.isCompetitionNameValid,
              name: '_CarRegisterControllerBase.isCompetitionNameValid'))
      .value;
  Computed<bool>? _$isLegendaryNumberValidComputed;

  @override
  bool get isLegendaryNumberValid => (_$isLegendaryNumberValidComputed ??=
          Computed<bool>(() => super.isLegendaryNumberValid,
              name: '_CarRegisterControllerBase.isLegendaryNumberValid'))
      .value;
  Computed<bool>? _$allInputsValidComputed;

  @override
  bool get allInputsValid =>
      (_$allInputsValidComputed ??= Computed<bool>(() => super.allInputsValid,
              name: '_CarRegisterControllerBase.allInputsValid'))
          .value;

  late final _$carNumberAtom =
      Atom(name: '_CarRegisterControllerBase.carNumber', context: context);

  @override
  String get carNumber {
    _$carNumberAtom.reportRead();
    return super.carNumber;
  }

  @override
  set carNumber(String value) {
    _$carNumberAtom.reportWrite(value, super.carNumber, () {
      super.carNumber = value;
    });
  }

  late final _$competitorNameAtom =
      Atom(name: '_CarRegisterControllerBase.competitorName', context: context);

  @override
  String get competitorName {
    _$competitorNameAtom.reportRead();
    return super.competitorName;
  }

  @override
  set competitorName(String value) {
    _$competitorNameAtom.reportWrite(value, super.competitorName, () {
      super.competitorName = value;
    });
  }

  late final _$legendaryNumberAtom = Atom(
      name: '_CarRegisterControllerBase.legendaryNumber', context: context);

  @override
  String get legendaryNumber {
    _$legendaryNumberAtom.reportRead();
    return super.legendaryNumber;
  }

  @override
  set legendaryNumber(String value) {
    _$legendaryNumberAtom.reportWrite(value, super.legendaryNumber, () {
      super.legendaryNumber = value;
    });
  }

  late final _$registerCarAsyncAction =
      AsyncAction('_CarRegisterControllerBase.registerCar', context: context);

  @override
  Future<void> registerCar() {
    return _$registerCarAsyncAction.run(() => super.registerCar());
  }

  late final _$_CarRegisterControllerBaseActionController =
      ActionController(name: '_CarRegisterControllerBase', context: context);

  @override
  void changeCarNumber(String newValue) {
    final _$actionInfo = _$_CarRegisterControllerBaseActionController
        .startAction(name: '_CarRegisterControllerBase.changeCarNumber');
    try {
      return super.changeCarNumber(newValue);
    } finally {
      _$_CarRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCompetitorName(String newValue) {
    final _$actionInfo = _$_CarRegisterControllerBaseActionController
        .startAction(name: '_CarRegisterControllerBase.changeCompetitorName');
    try {
      return super.changeCompetitorName(newValue);
    } finally {
      _$_CarRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLegendaryNumber(String newValue) {
    final _$actionInfo = _$_CarRegisterControllerBaseActionController
        .startAction(name: '_CarRegisterControllerBase.changeLegendaryNumber');
    try {
      return super.changeLegendaryNumber(newValue);
    } finally {
      _$_CarRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carNumber: ${carNumber},
competitorName: ${competitorName},
legendaryNumber: ${legendaryNumber},
isCarNumberValid: ${isCarNumberValid},
isCompetitionNameValid: ${isCompetitionNameValid},
isLegendaryNumberValid: ${isLegendaryNumberValid},
allInputsValid: ${allInputsValid}
    ''';
  }
}

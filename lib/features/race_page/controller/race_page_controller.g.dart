// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RacePageController on _RacePageControllerBase, Store {
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

  late final _$allStopNamesAsyncAction =
      AsyncAction('_RacePageControllerBase.allStopNames', context: context);

  @override
  Future<void> allStopNames() {
    return _$allStopNamesAsyncAction.run(() => super.allStopNames());
  }

  late final _$_RacePageControllerBaseActionController =
      ActionController(name: '_RacePageControllerBase', context: context);

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
  String toString() {
    return '''
currentStop: ${currentStop},
allStops: ${allStops}
    ''';
  }
}

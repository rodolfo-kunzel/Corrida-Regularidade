// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_list_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StopListPageController on _StopListPageControllerBase, Store {
  late final _$stopsInformationAtom = Atom(
      name: '_StopListPageControllerBase.stopsInformation', context: context);

  @override
  List<Map<String, dynamic>> get stopsInformation {
    _$stopsInformationAtom.reportRead();
    return super.stopsInformation;
  }

  @override
  set stopsInformation(List<Map<String, dynamic>> value) {
    _$stopsInformationAtom.reportWrite(value, super.stopsInformation, () {
      super.stopsInformation = value;
    });
  }

  late final _$getAllStopsAsyncAction =
      AsyncAction('_StopListPageControllerBase.getAllStops', context: context);

  @override
  Future<void> getAllStops() {
    return _$getAllStopsAsyncAction.run(() => super.getAllStops());
  }

  late final _$deleteStopAsyncAction =
      AsyncAction('_StopListPageControllerBase.deleteStop', context: context);

  @override
  Future<void> deleteStop(dynamic listId) {
    return _$deleteStopAsyncAction.run(() => super.deleteStop(listId));
  }

  @override
  String toString() {
    return '''
stopsInformation: ${stopsInformation}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_list_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CarListPageController on _CarListPageBaseController, Store {
  late final _$carInformationAtom =
      Atom(name: '_CarListPageBaseController.carInformation', context: context);

  @override
  List<Map<String, dynamic>> get carInformation {
    _$carInformationAtom.reportRead();
    return super.carInformation;
  }

  @override
  set carInformation(List<Map<String, dynamic>> value) {
    _$carInformationAtom.reportWrite(value, super.carInformation, () {
      super.carInformation = value;
    });
  }

  late final _$getAllCarsAsyncAction =
      AsyncAction('_CarListPageBaseController.getAllCars', context: context);

  @override
  Future<void> getAllCars() {
    return _$getAllCarsAsyncAction.run(() => super.getAllCars());
  }

  late final _$deleteCarAsyncAction =
      AsyncAction('_CarListPageBaseController.deleteCar', context: context);

  @override
  Future<void> deleteCar(dynamic carId) {
    return _$deleteCarAsyncAction.run(() => super.deleteCar(carId));
  }

  @override
  String toString() {
    return '''
carInformation: ${carInformation}
    ''';
  }
}

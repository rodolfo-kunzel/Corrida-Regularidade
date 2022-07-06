// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$allCarInformationAtom =
      Atom(name: '_HomeControllerBase.allCarInformation', context: context);

  @override
  List<Map<String, String>> get allCarInformation {
    _$allCarInformationAtom.reportRead();
    return super.allCarInformation;
  }

  @override
  set allCarInformation(List<Map<String, String>> value) {
    _$allCarInformationAtom.reportWrite(value, super.allCarInformation, () {
      super.allCarInformation = value;
    });
  }

  late final _$getAllCarInformationAsyncAction =
      AsyncAction('_HomeControllerBase.getAllCarInformation', context: context);

  @override
  Future<void> getAllCarInformation() {
    return _$getAllCarInformationAsyncAction
        .run(() => super.getAllCarInformation());
  }

  @override
  String toString() {
    return '''
allCarInformation: ${allCarInformation}
    ''';
  }
}

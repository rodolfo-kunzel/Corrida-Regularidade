import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'race_page_controller.g.dart';

class RacePageController = _RacePageControllerBase with _$RacePageController;

abstract class _RacePageControllerBase with Store {
  @observable
  String currentStop = "";

  @observable
  String currentCar = "";

  @observable 
  TimeOfDay time = TimeOfDay.now();

  @action
  void changeCarPassedThroughtTime(TimeOfDay newValue) =>
    time = newValue;

  @action
  void changeCurrentStop(dynamic newValue) => currentStop = newValue;

  @action
  void changeCurrentCar(dynamic newValue) => currentCar = newValue;

  @observable
  List<String> allStops = <String>[].asObservable();

  @observable
  List<String> allCars = <String>[].asObservable();

  @computed
  bool get allInputsValid => currentStop != "" && currentCar != "";

  @action
  void displayTimeDialog(context) async {
    final TimeOfDay? timePicker =
     await showTimePicker(context: context, initialTime: TimeOfDay.now());

     changeCarPassedThroughtTime(timePicker!);
  }

  @action
  Future<void> allStopNames() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection("Pontos").get();
    for (var i = 0; i < querySnapshot.docs.length; i++) {
      allStops.add(querySnapshot.docs[i].id);
    }
  }

  @action
  Future<void> allCarNames() async {
    final queryCarSnapshot =
        await FirebaseFirestore.instance.collection("Carros").get();
    for (var i = 0; i < queryCarSnapshot.docs.length; i++) {
      allCars.add(queryCarSnapshot.docs[i].id);
    }
  }

  @action
  Future<void> stopCarTimeRegister() async {
    var carPassedThroughtMinute = time.minute;
    var carPassedThroughtHour = time.hour;
    await FirebaseFirestore.instance
        .collection("Carros")
        .doc(currentCar)
        .collection("PontosPassados")
        .doc(currentStop)
        .set({
          "Soma Minutos Feito": carPassedThroughtMinute + (carPassedThroughtHour * 60),
          "Soma Minutos Esperado": carPassedThroughtMinute + (carPassedThroughtHour * 60),
          "Ponto": currentStop,
        });
  }
}

import 'dart:async';

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

  @observable
  DateTime currentTime = DateTime.now();

  @action
  DateTime timeUpdated() {
    currentTime = DateTime.now();
    return currentTime;
  }

  @action
  void changeCarPassedThroughtTime(TimeOfDay newValue) => time = newValue;

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
    var carPassedThroughtSecond = currentTime.second;
    var carPassedThroughtMinute = currentTime.minute;
    var carPassedThroughtHour = currentTime.hour;
    var carPassedThroughtMinuteTime = await FirebaseFirestore.instance
        .collection("Pontos")
        .doc(currentStop)
        .get();
    await FirebaseFirestore.instance
        .collection("Carros")
        .doc(currentCar)
        .collection("PontosPassados")
        .doc(currentStop)
        .set({
      "Minutos Totais": carPassedThroughtMinute +
          (carPassedThroughtHour * 60) +
          (carPassedThroughtSecond / 60),
      "Minutos Esperados Após Saída":
          int.parse(carPassedThroughtMinuteTime.data()!["Minutos após início"]),
      "Início": carPassedThroughtMinuteTime.data()!["Início"],
      "Ponto": currentStop,
    });
    if (carPassedThroughtMinuteTime.data()!["Início"] == true) {
      FirebaseFirestore.instance.collection("Carros").doc(currentCar).update({
        "Minutos de Início":
            carPassedThroughtMinute + (carPassedThroughtHour * 60),
      });
      FirebaseFirestore.instance
          .collection("Carros")
          .doc(currentCar)
          .collection("PontosPassados")
          .doc(currentStop)
          .update({"Pontos": 0});
    } else {
      var currentCarDocument = await FirebaseFirestore.instance
          .collection("Carros")
          .doc(currentCar)
          .get();
      var initTimeCurrentCarDocument =
          await currentCarDocument.data()!["Minutos de Início"];
      var currentStopTime = carPassedThroughtMinute +
          (carPassedThroughtHour * 60) +
          (carPassedThroughtSecond / 60);
      FirebaseFirestore.instance
          .collection("Carros")
          .doc(currentCar)
          .collection("PontosPassados")
          .doc(currentStop)
          .update(
        {
          "Pontos": ((currentStopTime - initTimeCurrentCarDocument) -
                      double.parse(carPassedThroughtMinuteTime
                          .data()!["Minutos após início"])) >
                  0
              ? ((currentStopTime - initTimeCurrentCarDocument) -
                      double.parse(carPassedThroughtMinuteTime
                          .data()!["Minutos após início"])) *
                  -1
              : ((currentStopTime - initTimeCurrentCarDocument) -
                  double.parse(carPassedThroughtMinuteTime
                      .data()!["Minutos após início"])),
        },
      );
    }
  }
}

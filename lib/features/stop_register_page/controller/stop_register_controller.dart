import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'stop_register_controller.g.dart';

class StopRegisterController = _StopRegisterControllerBase
    with _$StopRegisterController;

abstract class _StopRegisterControllerBase with Store {
  @observable
  String stopName = "";

  @action
  void changeStopName(String newValue) => stopName = newValue;

  @observable
  String minutesSinceStart = "";

  @action
  void changeMinutesSinceStart(String newValue) => minutesSinceStart = newValue;

  @observable
  String dropDownValue = "SIM";

  @action 
  void changeDropDownValue(dynamic newValue) => dropDownValue = newValue;

  @computed 
  bool get allInputsValid => stopName.isNotEmpty;

  @computed
  bool get isStart => dropDownValue == "SIM";

  @action
   Future<void> stopRegister() async {
    if (isStart) {
    try {
      await FirebaseFirestore.instance.collection("Pontos").doc(stopName).set({
        "Nome do Ponto": stopName,
        "Minutos após início": 0,
        "Início": isStart   
      });
    } on FirebaseException catch (e) {
      print(e);
    }
    } else {
      try {
      await FirebaseFirestore.instance.collection("Pontos").doc(stopName).set({
        "Nome do Ponto": stopName,
        "Minutos após início": minutesSinceStart,
        "Início": isStart   
      });
    } on FirebaseException catch (e) {
      print(e);
    }
    }

  }
}

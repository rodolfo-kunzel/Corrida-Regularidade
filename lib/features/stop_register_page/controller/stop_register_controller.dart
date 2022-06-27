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
  int minutesSinceStart = 0;

  @action
  void changeMinutesSinceStart(int newValue) => minutesSinceStart = newValue;

  @observable
  String dropDownValue = "SIM";

  @observable
  List dropDownValues =[];

  @action 
  void changeDropDownValue(dynamic newValue) => dropDownValue = newValue;

  @computed 
  bool get allInputsValid => stopName.isNotEmpty && minutesSinceStart != 0;

  @action
   Future<void> stopRegister() async {
    try {
      await FirebaseFirestore.instance.collection("Pontos").doc().set({
        "Nome do Ponto": stopName,
        "Minutos após início": minutesSinceStart,
        "Início": dropDownValue    
      });
    } on FirebaseException catch (e) {
      print(e);
    }

  }
}

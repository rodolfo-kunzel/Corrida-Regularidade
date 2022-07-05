import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
part 'car_register_controller.g.dart';

class CarRegisterController = _CarRegisterControllerBase with _$CarRegisterController;

abstract class _CarRegisterControllerBase with Store {

  @observable
  String carNumber = "";

  @action
  void changeCarNumber(String newValue) => carNumber = newValue;

  @computed 
  bool get isCarNumberValid => carNumber.isNotEmpty;

  @observable
  String competitorName = "";

  @action 
  void changeCompetitorName(String newValue) => competitorName = newValue;

  @computed 
  bool get isCompetitionNameValid => competitorName.isNotEmpty;

  @observable
  String legendaryNumber = "";

  @action
  void changeLegendaryNumber(String newValue) => legendaryNumber = newValue;

  @computed 
  bool get isLegendaryNumberValid =>  legendaryNumber.isNotEmpty;

  @computed 
  bool get allInputsValid => isCarNumberValid && isCompetitionNameValid && isLegendaryNumberValid;

  @action
  Future<void> registerCar() async {
    try {
      await FirebaseFirestore.instance.collection("Carros").doc(carNumber).set({
        "Número do Carro": carNumber,
        "Nome do Competidor": competitorName,
        "Número do Legendário": legendaryNumber  ,  
        "id": carNumber,
      });
    } on FirebaseException catch (e) {
      print(e);
    }

  }
}
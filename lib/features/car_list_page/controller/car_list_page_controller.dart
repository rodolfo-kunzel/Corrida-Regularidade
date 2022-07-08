import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'car_list_page_controller.g.dart';

class CarListPageController = _CarListPageBaseController
    with _$CarListPageController;

abstract class _CarListPageBaseController with Store {
  @observable
  List<Map<String, dynamic>> carInformation =
      <Map<String, dynamic>>[].asObservable();

  @action
  Future<void> getAllCars() async {
    carInformation.clear();
    var carsQuerySnapShot =
        await FirebaseFirestore.instance.collection("Carros").get();
    var totalCars = carsQuerySnapShot.docs.length;
    for (var i = 0; i < totalCars; i++) {
      var querySnapShotCurrentCar = await FirebaseFirestore.instance
          .collection("Carros")
          .doc(carsQuerySnapShot.docs[i].id)
          .get();
      var currentCarLegendaryName =
          querySnapShotCurrentCar.data()!["Número do Legendário"];
      debugPrint(carInformation.toString());
      carInformation.toString().contains(
              "Número do Carro: ${carsQuerySnapShot.docs[i].id}, Número do Legendàrio: ${currentCarLegendaryName.toString()}")
          ? null
          : carInformation.add(
              {
                "Número do Carro": carsQuerySnapShot.docs[i].id,
                "Número do Legendàrio": currentCarLegendaryName,
              },
            );
    }
    carInformation.sort(
      (a, b) => (b["Número do Carro"]!).compareTo(
        a["Número do Legendàrio"]!,
      ),
    );
  }

  @action
  Future<void> deleteCar(carId) async {
    FirebaseFirestore.instance
        .collection("Carros")
        .doc(carId.toString())
        .delete();
  }
}

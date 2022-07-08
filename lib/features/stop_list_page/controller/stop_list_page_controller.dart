import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'stop_list_page_controller.g.dart';

class StopListPageController = _StopListPageControllerBase
    with _$StopListPageController;

abstract class _StopListPageControllerBase with Store {
  @observable
  List<Map<String, dynamic>> stopsInformation =
      <Map<String, dynamic>>[].asObservable();

  @action
  Future<void> getAllStops() async {
    stopsInformation.clear();
    var carsQuerySnapShot =
        await FirebaseFirestore.instance.collection("Pontos").get();
    var totalCars = carsQuerySnapShot.docs.length;
    for (var i = 0; i < totalCars; i++) {
      var querySnapShotCurrentCar = await FirebaseFirestore.instance
          .collection("Pontos")
          .doc(carsQuerySnapShot.docs[i].id)
          .get();
      var currentCarLegendaryName =
          await querySnapShotCurrentCar.data()!["Minutos após início"];
      debugPrint(stopsInformation.toString());
      stopsInformation.toString().contains(
              "Nome do Ponto: ${carsQuerySnapShot.docs[i].id}, Minutos após início: ${currentCarLegendaryName.toString()}")
          ? null
          : stopsInformation.add(
              {
                "Nome do Ponto": carsQuerySnapShot.docs[i].id,
                "Minutos após início": currentCarLegendaryName,
              },
            );
    }
    stopsInformation.sort(
      (a, b) => (b["Nome do Ponto"]!).compareTo(
        a["Minutos após início"]!,
      ),
    );
  }

  @action
  Future<void> deleteStop(listId) async {
    FirebaseFirestore.instance
        .collection("Pontos")
        .doc(listId.toString())
        .delete();
  }
}

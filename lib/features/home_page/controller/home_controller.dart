import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  String currentStop = "";

  @observable
  String currentCar = "";

  @observable
  int currentCarPoint = 0;

  @observable
  List<String> allCars = <String>[].asObservable();

  @observable
  List<String> allStops = <String>[].asObservable();

  @action
  Future<void> allCarNames() async {
    final queryCarSnapshot =
        await FirebaseFirestore.instance.collection("Carros").get();
    for (var i = 0; i < queryCarSnapshot.docs.length; i++) {
      allCars.add(queryCarSnapshot.docs[i].id);
    }
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
  Future<void> registerCurrentCarPoints() async {
    for (var i = 0; i < allCars.length; i++) {
      currentCar = allCars[i];
      for (var y = 0; y < allStops.length; y++) {
        currentStop = allStops[y];
        FirebaseFirestore.instance
            .collection("Carros")
            .doc(currentCar)
            .collection("PontosPassados")
            .doc(currentStop);
      }
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
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
  Future<void> allCarNames() async {
    final queryCarSnapshot =
        await FirebaseFirestore.instance.collection("Carros").get();
    for (var i = 0; i < queryCarSnapshot.docs.length; i++) {
      var queryCurrentCarStopsSnapshot = queryCarSnapshot.docs[i].data()["PontosPassados"];
      for (var y = 0; queryCurrentCarStopsSnapshot);
    }
  }
}

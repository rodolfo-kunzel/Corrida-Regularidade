import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
part 'race_page_controller.g.dart';

class RacePageController = _RacePageControllerBase with _$RacePageController;

abstract class _RacePageControllerBase with Store {

  @observable
  String currentStop = "";

  @action 
  void changeCurrentStop(dynamic newValue) => currentStop = newValue;

  @observable
  List allStops = [].asObservable();

  @action
  Future<void> allStopNames() async {
    FirebaseFirestore.instance.collection("Pontos").get().then((value) {for (var element in value.docs) { allStops.add(element.id);}});
  }
  
}
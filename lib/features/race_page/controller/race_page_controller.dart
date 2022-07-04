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
  List<String> allStops = <String>[].asObservable();

  @action
  Future<void> allStopNames() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection("Pontos").get();
    for (var i = 0; i < querySnapshot.docs.length; i++) {
      allStops.add(querySnapshot.docs[i].id);
    }
  }
}

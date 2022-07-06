import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  List<Map<String, String>> allCarInformation =
      <Map<String, String>>[].asObservable();

  @action
  Future<void> getAllCarInformation() async {
    var totalStops =
        await FirebaseFirestore.instance.collection("Pontos").get();
    var totalStopsCount = totalStops.docs.length;
    final querySnapshot =
        await FirebaseFirestore.instance.collection("Carros").get();
    for (var i = 0; i < querySnapshot.docs.length; i++) {
      var totalCurrentCarScore = 0;
      var querySnapShotCurrentDocument = await FirebaseFirestore.instance
          .collection("Carros")
          .doc(querySnapshot.docs[i].id)
          .collection("PontosPassados")
          .get();
      if (querySnapShotCurrentDocument.docs.length == totalStopsCount) {
        for (var j = 0; j < querySnapShotCurrentDocument.docs.length; j++) {
          final int currentCarSelectedStopScore =
              await querySnapShotCurrentDocument.docs[j].data()["Pontos"];
          totalCurrentCarScore += currentCarSelectedStopScore;
        }
        allCarInformation.add(
          {
            "Nome": querySnapshot.docs[i].id,
            "Score": totalCurrentCarScore.toString(),
          },
        );
      }
    }
  }
}

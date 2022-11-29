import 'package:cloud_firestore/cloud_firestore.dart';

class ResultRepo{
  getTResults() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return firestore.collection('Patients').doc("01095553356")
        .snapshots().map((event) {
      final List<String> offersList = [];
      print('++++++++++++++++++++========');
      print(event['result']);

      for (var element in event['result']) {
        print(element.data()['image']);

        offersList.add(element.data()['image']);
      }
      return offersList;
    });
  }


}
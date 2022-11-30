import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/result_model.dart';

class ResultRepo{
  getTResults() {
    ResultModel resultModel;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return firestore.collection('Patients').doc("01095553356").collection('results')
        .snapshots().map((event) {
      final List<ResultModel> offersList = [];
      print('++++++++++++++++++++');
      print(event.docs);

      for (var element in event.docs) {
        print(element.data()['result']);

        offersList.add(ResultModel(date: element.data()['date'], pdf: element.data()['result']));
      }
      return offersList;
    });
  }


}
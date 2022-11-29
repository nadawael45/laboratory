import 'package:cloud_firestore/cloud_firestore.dart';

class OfferRepo{
  getOffers() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return firestore.collection('offers')
        .snapshots().map((event) {
      final List<String> offersList = [];
        print('++++++++++++++++++++========');
        print(event.docs);

      for (var element in event.docs) {
        print(element.data()['image']);

        offersList.add(element.data()['image']);
      }
      return offersList;
    });
  }


}
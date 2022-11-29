
abstract class OffersState {}

class OffersInitial extends OffersState {}
class OffersSuccess extends OffersState {
  List images=[];

  OffersSuccess(this.images);
}
class OffersFailed extends OffersState {}



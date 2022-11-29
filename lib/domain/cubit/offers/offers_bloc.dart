import 'dart:async';

import 'package:algomhoryalab/data/repository/offers_repo.dart';
import 'package:algomhoryalab/domain/cubit/offers/offers_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class OffersBloc extends Cubit<OffersState> {
  OffersBloc() : super(OffersInitial());
    static OffersBloc get(context) => BlocProvider.of(context);
  late final StreamSubscription<List<String>>subscription;
  List images=[];
  getMyProduct() {
    emit((OffersInitial()));
    subscription=
    OfferRepo().getOffers().listen((event) {
      images=event;
        print(event.toString());
      emit(OffersSuccess(event));
    })..onError((e){
      emit(OffersFailed());

    });
  }

  @override
  Future<void> close() async{
    await subscription.cancel();
    return super.close();
  }

}

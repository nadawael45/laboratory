import 'dart:async';

import 'package:algomhoryalab/data/repository/offers_repo.dart';
import 'package:algomhoryalab/data/repository/result_repo.dart';
import 'package:algomhoryalab/domain/cubit/offers/offers_state.dart';
import 'package:algomhoryalab/domain/cubit/results/results_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class ResultBloc extends Cubit<ResultStates> {
  ResultBloc() : super(ResultInitial());
    static ResultBloc get(context) => BlocProvider.of(context);
  late final StreamSubscription<List<String>>subscription2;
  List images=[];

  getMyResult() {
    emit((ResultInitial()));
    subscription2=
    ResultRepo().getTResults().listen((event) {
      images=event;
        print(event.toString());
      emit(ResultSuccess(event));
    })..onError((e){
      emit(ResultFailed());

    });
  }

  @override
  Future<void> close() async{
    await subscription2.cancel();
    return super.close();
  }

}

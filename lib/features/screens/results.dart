import 'package:algomhoryalab/domain/cubit/results/results_bloc.dart';
import 'package:algomhoryalab/domain/cubit/results/results_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Results extends StatelessWidget {
  const Results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      BlocConsumer<ResultBloc, ResultStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return GridView.builder(
            itemCount: ResultBloc.get(context).images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
              ), itemBuilder: (context, index) {
            return Container(
              height: 100,
              width: 100,
              child: Image.network(ResultBloc.get(context).images[index]),
            );
          });
        },
      ),
    );
  }
}

import 'dart:math';

import 'package:algomhoryalab/core/router/router.dart';
import 'package:algomhoryalab/domain/cubit/results/results_bloc.dart';
import 'package:algomhoryalab/domain/cubit/results/results_state.dart';
import 'package:algomhoryalab/features/screens/result_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_text.dart';

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
          return Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              itemCount: ResultBloc.get(context).resultList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 50,
                  childAspectRatio: 1.3

                ), itemBuilder: (context, index) {
              return InkWell(
                onTap: ()async{
                 // MagicRouter.navigateTo(ResultDetails(ResultBloc.get(context).resultList[index].pdf.toString()));
                  final Uri url = Uri.parse(ResultBloc.get(context).resultList[index].pdf.toString());
                  if (!await launchUrl(url)) {
                  throw 'Could not launch $url';
                  }
                },
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Icon_pdf_file.svg/1200px-Icon_pdf_file.svg.png'
                        ,height: 30,width: 60,

                        ),
                      ),
                      const Divider(height: 1,),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: CustomText(
                          text:ResultBloc.get(context).resultList[index].date ,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

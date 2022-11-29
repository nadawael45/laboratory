import 'package:algomhoryalab/core/color_manager/color_manager.dart';
import 'package:algomhoryalab/core/router/router.dart';
import 'package:algomhoryalab/domain/cubit/admin_login/admin_login_cubit.dart';
import 'package:algomhoryalab/domain/cubit/offers/offers_bloc.dart';
import 'package:algomhoryalab/domain/cubit/register_patient/register_cubit.dart';
import 'package:algomhoryalab/domain/cubit/results/results_bloc.dart';
import 'package:algomhoryalab/features/screens/on_boarding.dart';
import 'package:algomhoryalab/features/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(
        providers: [
          BlocProvider(create:  (_) =>EmailPasswordCubit()),
          BlocProvider(create:  (_) =>RegisterCubit()),
          BlocProvider(create:  (_) =>ResultBloc()),
          BlocProvider(create:  (_) =>OffersBloc()..getMyProduct())

        ],
        child: Sizer(
        builder: (BuildContext context, Orientation orientation, DeviceType deviceType)=>
         MaterialApp(
           onGenerateRoute: onGenerateRoute,
           navigatorKey: navigatorKey,

           debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: ColorsManager.blueColor,
          ),
          home:  SplashScreen(nextScreen: OnBoarding(),),
        ),
    ),
      );
  }
}



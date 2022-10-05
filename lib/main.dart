import 'package:algomhoryalab/core/router/router.dart';
import 'package:algomhoryalab/features/screens/on_boarding.dart';
import 'package:algomhoryalab/features/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType)=>
       MaterialApp(
         onGenerateRoute: onGenerateRoute,
         navigatorKey: navigatorKey,

         debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home:  SplashScreen(nextScreen: OnBoarding(),),
      ),
    );
  }
}



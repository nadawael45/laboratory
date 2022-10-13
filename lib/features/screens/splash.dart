import 'package:algomhoryalab/core/image_manager/image_manager.dart';
import 'package:algomhoryalab/core/router/router.dart';
import 'package:algomhoryalab/features/screens/on_boarding.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class SplashScreen extends StatefulWidget {
  final Widget? nextScreen;

  const SplashScreen({Key? key, this.nextScreen}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 5)).then((val) {
      MagicRouter.navigateTo(OnBoarding());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(image:DecorationImage(image: AssetImage(ImageManager.lab2),fit: BoxFit.fill)),
         // child: Image.asset(ImageManager.logo,height: 400,width: 50,),
        ));
//        AnimatedSplashScreen(
//            duration: 3000,
//            splashIconSize: 300,
//            splash: Image.asset(ImageManager.logo_ful),
//            nextScreen: nextScreen!,
//            splashTransition: SplashTransition.fadeTransition,
//            backgroundColor: Colors.white)

  //  );
  }
}
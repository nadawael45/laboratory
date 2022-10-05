import 'package:algomhoryalab/core/image_manager/image_manager.dart';
import 'package:algomhoryalab/core/router/router.dart';
import 'package:algomhoryalab/features/screens/otp_code.dart';
import 'package:algomhoryalab/features/widgets/custom_button.dart';
import 'package:algomhoryalab/features/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only
            (bottomLeft: Radius.circular(180),bottomRight:Radius.circular(180) )),
          width: double.infinity,
          height: MediaQuery.of(context).size.height*0.58,
          child: ClipRRect(borderRadius:
          const BorderRadius.only
            (bottomLeft: Radius.circular(180),bottomRight:Radius.circular(180) )
            ,child: Image.asset(ImageManager.background,fit: BoxFit.fill,),),
        ),
        const SizedBox(height: 50,),
        CustomText(text: 'The best specialists!',fontWeight: FontWeight.bold,txtSize: 25,),
        const SizedBox(height: 15,),
        CustomText(text: 'The best specialists! ever',),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: CustomButton('Next', (){
            MagicRouter.navigateAndPopUntilFirstPage(OtpCode());
          }),
        ),
        const SizedBox(height: 20,),




      ],),
    );
  }
}

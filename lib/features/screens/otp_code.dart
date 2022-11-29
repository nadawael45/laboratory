import 'package:algomhoryalab/core/color_manager/color_manager.dart';
import 'package:algomhoryalab/core/image_manager/image_manager.dart';
import 'package:algomhoryalab/core/router/router.dart';
import 'package:algomhoryalab/domain/cubit/admin_login/admin_login_cubit.dart';
import 'package:algomhoryalab/domain/cubit/admin_login/admin_login_states.dart';
import 'package:algomhoryalab/features/dialogs/toast.dart';
import 'package:algomhoryalab/features/screens/admin_login.dart';
import 'package:algomhoryalab/features/screens/admin_register.dart';
import 'package:algomhoryalab/features/screens/patient_login.dart';
import 'package:algomhoryalab/features/widgets/custom_button.dart';
import 'package:algomhoryalab/features/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import 'home.dart';
class OtpCode extends StatelessWidget {
  TextEditingController controllerOtp=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        child:
          Container(
            width: 100.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    MagicRouter.navigateTo(AdminLogin());
                  },
                    child: Image.asset(ImageManager.admin,height: 15.h,fit: BoxFit.fill,)),
                CustomText(text: 'Admin',fontWeight: FontWeight.bold,),
                SizedBox(height: 15.h,),
                InkWell(
                    onTap: (){
                      MagicRouter.navigateTo(PatientLogin());
                    },
                    child: Image.asset(ImageManager.patient,height: 15.h,fit: BoxFit.fill,)),
                SizedBox(height: 1.h,),

                CustomText(text: 'Patient',fontWeight: FontWeight.bold,),
              ],
            ),
          )
//         SingleChildScrollView(
//
//           child: BlocListener<EmailPasswordCubit, EmailPasswordStatus>(
//   listener: (context, state) {
// if(state is OtpSuccess){
//   showToast(msg: 'Login Successfully', state: ToastedStates.SUCCESS);
//   MagicRouter.navigateTo(Home());
// }
//   },
//   child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 30,),
//             CustomText(text: 'Verify account',txtSize: 18,),
//               Image.asset(ImageManager.logo,height: 150,width: 150,fit:BoxFit.cover),
//               CustomText(text: 'Mobile verification has been \nsent to you',fontWeight: FontWeight.bold,txtSize: 20,),
//               const SizedBox(height: 30,),
//               CustomText(text: 'We have sent an otp code to your phone \nplease check your sms',txtSize: 12,),
//               const SizedBox(height: 50,),
//               PinCodeTextField(
//                 length: 6,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 controller: controllerOtp,
//
//                 animationType: AnimationType.none,
//                 cursorColor: ColorsManager.blueColor,
//                 keyboardType: TextInputType.number,
//                 autoFocus: true,
//                 textStyle: TextStyle(
//                     fontWeight: FontWeight.normal, fontSize: 15.sp),
//                 pinTheme: PinTheme(
//                   fieldOuterPadding: EdgeInsets.all(2.sp),
//                   shape: PinCodeFieldShape.underline,
//                   borderRadius: BorderRadius.circular(5),
//                   fieldHeight: 37.sp,
//                   fieldWidth: 30.sp,
//                   activeFillColor: Colors.white,
//                   selectedFillColor: Colors.white,
//                   inactiveFillColor: Colors.white,
//                   errorBorderColor: Colors.red,
//                   selectedColor: ColorsManager.blueColor,
//                   disabledColor: ColorsManager.blueColor,
//                   inactiveColor: ColorsManager.blueColor,
//                 ),
//                 animationDuration: const Duration(milliseconds: 500),
//                 backgroundColor: Colors.transparent,
//                 enableActiveFill: true,
//                 //errorAnimationController: errorController,
//                 // controller: textEditingController,
//
//                 onChanged: (value) {
//                   print(value);
// //                  setState(() {
// //                    currentText = value;
// //                  });
//                 },
//                 beforeTextPaste: (text) {
//                   print("Allowing to paste" + " $text");
//
//                   return true;
//                 },
//                 appContext: context,
//               ),
//               const SizedBox(height: 70,),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 80),
//                 child: CustomButton('Verify', (){
//                   print(controllerOtp.text);
//                   print(controllerOtp.text.runtimeType);
//                   if(controllerOtp.text== "18991"){
//                     MagicRouter.navigateAndPopAll( AdminLogin());
//                   }else{
//                   //  EmailPasswordCubit.get(context).submitCode(controllerOtp.text);
//
//                   }
//                 }),
//               )
//
//             ],),
// ),
//         ),
      ),
    );
  }
}

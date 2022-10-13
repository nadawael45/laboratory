import 'package:algomhoryalab/core/image_manager/image_manager.dart';
import 'package:algomhoryalab/core/router/router.dart';
import 'package:algomhoryalab/core/validator/validator.dart';
import 'package:algomhoryalab/domain/cubit/admin_login/admin_login_cubit.dart';
import 'package:algomhoryalab/domain/cubit/admin_login/admin_login_states.dart';
import 'package:algomhoryalab/features/dialogs/toast.dart';
import 'package:algomhoryalab/features/screens/admin_register.dart';
import 'package:algomhoryalab/features/screens/home.dart';
import 'package:algomhoryalab/features/widgets/custom_button.dart';
import 'package:algomhoryalab/features/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
class AdminLogin extends StatelessWidget {
   AdminLogin({Key? key}) : super(key: key);
  TextEditingController emailcontroller=TextEditingController();
   TextEditingController passcontroller=TextEditingController();
   GlobalKey<FormState> formKey = GlobalKey<FormState>();
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocListener<EmailPasswordCubit, EmailPasswordStatus>(
              listener: (context, state) {
             if(state is EmailLoginSuccess)
               {
                 MagicRouter.navigateAndReplacement( AdminRegister());
               }if(state is EmailLoginFailed){
               showToast(msg: state.msg.toString(), state: ToastedStates.ERROR);
             }

  },
  child: Form(
    key: formKey,
    child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              Image.asset(ImageManager.logo_ful,width: 100.w,height: 30.h,fit: BoxFit.fill,),
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: CustomTextFormField(hintText: 'Admin e-mail',controller:emailcontroller ,validate: Validator.validateEmail,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: CustomTextFormField(hintText: 'Admin password',controller:passcontroller ,validate: Validator.validatePassword,),
                ),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButton('Login', (){
                    if(formKey.currentState!.validate()){
                      EmailPasswordCubit.get(context).logIn(emailcontroller.text, passcontroller.text);

                    }

                  }),
                ),




              ],),
  ),
),
        ),
      ),
    );
  }
}

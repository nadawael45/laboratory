import 'package:algomhoryalab/core/color_manager/color_manager.dart';
import 'package:algomhoryalab/core/validator/validator.dart';
import 'package:algomhoryalab/data/models/regester_model.dart';
import 'package:algomhoryalab/domain/cubit/register_patient/register_cubit.dart';
import 'package:algomhoryalab/domain/cubit/register_patient/register_states.dart';
import 'package:algomhoryalab/features/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../core/image_manager/image_manager.dart';
import '../../core/router/router.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_formfield.dart';
class PatientLogin extends StatelessWidget {
  PatientLogin({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController=TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocListener<RegisterCubit, RegisterStates>(
            listener: (context, state) {
              if(state is EmailLoginSuccess)
              {
                MagicRouter.navigateTo(Home());
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
                    child: CustomTextFormField(hintText: 'Enter Your Phone',controller:phoneController ,validate: Validator.validatePhone,),
                  ),
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton('Done', (){
                      if(formKey.currentState!.validate()){
                        RegisterCubit.get(context).logInPatient(phoneController.text,);
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
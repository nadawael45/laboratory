import 'package:algomhoryalab/core/color_manager/color_manager.dart';
import 'package:algomhoryalab/core/validator/validator.dart';
import 'package:algomhoryalab/data/regester_model.dart';
import 'package:algomhoryalab/domain/cubit/register_patient/register_cubit.dart';
import 'package:algomhoryalab/features/screens/home.dart';
import 'package:algomhoryalab/features/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../core/image_manager/image_manager.dart';
import '../../core/router/router.dart';
import '../../domain/cubit/admin_login/admin_login_cubit.dart';
import '../../domain/cubit/admin_login/admin_login_states.dart';
import '../dialogs/toast.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_formfield.dart';
class AdminRegister extends StatelessWidget {
   AdminRegister({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController=TextEditingController();
   TextEditingController nameController=TextEditingController();
   TextEditingController idController=TextEditingController();



   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocListener<EmailPasswordCubit, EmailPasswordStatus>(
            listener: (context, state) {
              if(state is PhoneAuthSuccess)
              {
                MagicRouter.navigateTo( Home());
              }if(state is PhoneAuthFailed){
                showToast(msg: state.error.toString(), state: ToastedStates.ERROR);
              }

            },
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(ImageManager.logo_ful,width: 100.w,height: 30.h,fit: BoxFit.fill,),
                  const SizedBox(height: 50,),
                  CustomText(text: 'Register a new Patient',color: ColorsManager.redColor,txtSize:13.sp),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: CustomTextFormField(hintText: 'Enter Patient Phone',controller:phoneController ,validate: Validator.validatePhone,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Row(
                      children: [
                        Expanded(child: CustomTextFormField(hintText: 'Enter Patient Name',controller:nameController ,validate: Validator.validateName,)),
                        SizedBox(width: 5.w,),
                        Expanded(child: CustomTextFormField(hintText: 'Enter Patient ID',controller:idController ,validate: Validator.validateEmpty,)),

                      ],
                    ),
                  ),

                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton('Done', (){
                      if(formKey.currentState!.validate()){
                       RegisterCubit.get(context).addPatient(phoneController.text, RegisterModel(
                         phone: phoneController.text,
                         patientId: idController.text,
                         name: nameController.text
                       ));
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

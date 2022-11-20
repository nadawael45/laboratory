import 'package:algomhoryalab/data/regester_model.dart';
import 'package:algomhoryalab/domain/cubit/register_patient/register_states.dart';
import 'package:algomhoryalab/features/dialogs/toast.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  static FirebaseAuth auth = FirebaseAuth.instance;
  RegisterCubit() : super(RegisterLoading());
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // String? id;

  static RegisterCubit get(context) => BlocProvider.of(context);
bool isFound=false;

  addPatient(phone,RegisterModel registerModel)async{
    emit(RegisterLoading());
    await  firestore.collection('Patients').get().then((value) =>
    {
      if(value!=null){

        value.docs.forEach((element){
      if(element['phone']==phone){
        isFound=true;
        showToast(msg: 'Already registered before', state: ToastedStates.ERROR);

      }else{
        isFound=false;
      }
        }),
        if(!isFound){
          print("isfound"),
          print(isFound),

          firestore.collection('Patients').doc(phone).set(registerModel.toJson()).then((value) =>
          {
            emit(RegisterSuccess()),
            showToast(msg: 'add success', state: ToastedStates.SUCCESS)

          }).onError((error, stackTrace) => {
            emit(RegisterFailed()),
            showToast(msg: error.toString(), state: ToastedStates.ERROR)

          })

        }

      }





      // if(value['phone'])
    });



  }


}

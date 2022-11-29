import 'package:algomhoryalab/data/regester_model.dart';
import 'package:algomhoryalab/domain/cubit/register_patient/register_states.dart';
import 'package:algomhoryalab/features/dialogs/toast.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  static FirebaseAuth auth = FirebaseAuth.instance;
  RegisterCubit() : super(RegisterLoading());
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // String? id;
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

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
  logInPatient(String phone) async{
    InternetConnectionChecker internetConnectionChecker = InternetConnectionChecker();
    if(await internetConnectionChecker.hasConnection == false){
      emit(EmailLoginFailed(msg: "Check your internet connection and try again"));
    }
    else{
      try {
        await firebaseFireStore.collection("Patients").where("phone" , isEqualTo: phone).get()
            .then((value) async {
          if(value.docs.length==0||value.docs.length==null){
            emit(EmailLoginFailed(msg: 'Your phone is inCorrect'));
             showToast(msg: 'Your phone is inCorrect', state:ToastedStates.ERROR );

          }else{

            emit(EmailLoginSuccess());
            // showToast(msg: 'Signed Successfully', state:ToastedStates.SUCCESS );

          }

        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          emit(EmailLoginFailed(msg: 'Your phone is inCorrect'));
          // showToast(msg:'No user found for that email.', state:ToastedStates.ERROR );

        }



        }
      }
    }
  }




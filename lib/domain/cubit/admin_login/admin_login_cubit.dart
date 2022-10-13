import 'package:algomhoryalab/features/dialogs/toast.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'admin_login_states.dart';

class EmailPasswordCubit extends Cubit<EmailPasswordStatus>{
  static FirebaseAuth auth = FirebaseAuth.instance;
  EmailPasswordCubit() : super(EmailLoading());
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  String? id;

  static EmailPasswordCubit get(context) => BlocProvider.of(context);
  logIn(String email , String pass) async{
    InternetConnectionChecker internetConnectionChecker = InternetConnectionChecker();
    if(await internetConnectionChecker.hasConnection == false){
      emit(EmailLoginFailed(msg: "Check your internet connection and try again"));
    }
    else{
      try {
        await firebaseFireStore.collection("admin").where("email" , isEqualTo: email).where("password" , isEqualTo: pass).get()
            .then((value) async {
          if(value.docs.length==0||value.docs.length==null){
            emit(EmailLoginFailed(msg: 'You are not admin'));
           // showToast(msg: 'You are not admin', state:ToastedStates.ERROR );

          }else{
            SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
            await sharedPreferences.setBool("signed", true);
            emit(EmailLoginSuccess());
           // showToast(msg: 'Signed Successfully', state:ToastedStates.SUCCESS );

          }

        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          emit(EmailLoginFailed(msg: 'No user found for that email.'));
         // showToast(msg:'No user found for that email.', state:ToastedStates.ERROR );

        } else if (e.code == 'wrong-password') {
          emit(EmailLoginFailed(msg: 'Wrong password provided for that user.'));
         // showToast(msg:'Wrong password provided for that user.', state:ToastedStates.ERROR );



        }
      }
    }
  }

  phoneAuth(String phone) {
    emit(PhoneAuthLoading());
// انا هنا معملتش تسجيل الدخول انا مجرد بس بتاكد من الرقم
    auth.verifyPhoneNumber(
        phoneNumber: phone,
        // اخر فتره ممكن ابعت فيها الكود/فتره سماحيه الكود
        timeout: const Duration(seconds: 30),
        //ده يعني كله تمام زالكود مظبوط
        //هحتاج بقي اسيف اليوزر ف الداتا بيز بتاعتي
        //cridential  نعتبرها بيانات اليوزر اللي هتتسجل علي الفايربيز زي ال  uid  بتاعه
        verificationCompleted: (credential) {
          auth.signInWithCredential(credential).then((value){} );
          // القيمه دي هي الي هتجيلي من الفايربيز واسيفها ف الفيرستور
          emit(OtpSuccess());
        },
        verificationFailed: (error) {
          showToast(msg: error.toString(), state:ToastedStates.ERROR );
          emit(OtpFailed(error.toString()));
          print(error.toString());
          showToast(msg: error.toString(), state: ToastedStates.ERROR);


        },
        codeSent: (String phoneId, [int? token]) {
          id=phoneId;
          emit(PhoneAuthSuccess(phone));
          print(id);
          print('phoneid');
        },
        //esend code
        codeAutoRetrievalTimeout: (error) {
          emit(OtpFailed('TimeOut'));
          showToast(msg:'TimeOut', state: ToastedStates.ERROR);

        });
  }

  //هعمل ميثود تانيه استقبل فيها ال  pin code
  submitCode(String otpCode){
    emit(OtpLoading());
    // ده هيستقلا الكود اللي اتبعت ليوزر وال id  اللي اتكريت لما سجل

    AuthCredential authCredential =PhoneAuthProvider.credential(verificationId: 'ABeshiAx9G6dLjvB3TUoZXRrX3oVT9zCEnS-mAff2c11Ic7_IGgI63eSYqLteoJbTDUpp29eB_0O-WSBtzcyhy3PCkW3Ddh1cMSPsHuChID5Xduk1ziZxMhy5hbaWt5Uofhi56RthmuSFap9pHg5XQWtz4oWDDdopGcJBslbTxEJUg1z6vHOrx4tjmI7NIn2NzOJFrI_smChWcMg3JQDho4tK9qCmgcoKe8ZWjtqepF3Pi7TVrTZ89o'!
        ,smsCode:otpCode );
    auth.signInWithCredential(authCredential).then((value) => {

      if(value != null)
        {
          emit(OtpSuccess()),

        }else{
        showToast(msg: 'login_wrong', state: ToastedStates.WARNING),
        emit(OtpFailed(onError.toString())),
        print(onError.toString()),
    showToast(msg:onError.toString(), state: ToastedStates.ERROR),



    }

    }).catchError((onError){
      print(onError.toString());
      showToast(msg: 'login_wrong', state: ToastedStates.WARNING);
      emit(OtpFailed(onError.toString()));
      print(onError.toString());
      showToast(msg:onError.toString(), state: ToastedStates.ERROR);



    });



  }
}

abstract class EmailPasswordStatus {}


class EmailLoading extends EmailPasswordStatus{}



class EmailLoginSuccess extends EmailPasswordStatus{
  String msg = "Email LoggedIn Successfully" ;
}
class EmailLoginFailed extends EmailPasswordStatus{
  String? msg ;
  EmailLoginFailed({required this.msg});
}

class OtpLoading extends EmailPasswordStatus{}
class OtpSuccess extends EmailPasswordStatus{}
class OtpFailed extends EmailPasswordStatus{
  String? error;

  OtpFailed(this.error);

}

class PhoneAuthLoading extends EmailPasswordStatus{}
// في حاله النجاح لازم اعرف رقم التليفون لان معني ان هو نجح ان االرساله اتبعتت بتاعه الرقم السري
class PhoneAuthSuccess extends EmailPasswordStatus{
  String? phoneNo;

  PhoneAuthSuccess(this.phoneNo);

}
class PhoneAuthFailed extends EmailPasswordStatus{
  String? error;

  PhoneAuthFailed(this.error);
}
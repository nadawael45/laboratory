class RegisterStates{}
class RegisterLoading extends RegisterStates{}
class RegisterSuccess extends RegisterStates{}
class RegisterFailed extends RegisterStates{}

class EmailLoading extends RegisterStates{}



class EmailLoginSuccess extends RegisterStates{
  String msg = "Email LoggedIn Successfully" ;
}
class EmailLoginFailed extends RegisterStates{
  String? msg ;
  EmailLoginFailed({required this.msg});
}
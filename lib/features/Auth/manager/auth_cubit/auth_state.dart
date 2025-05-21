abstract class AuthState{}

class AuthRegisterInitialState extends AuthState{}
class AuthRegisterLoadingState extends AuthState{}
class AuthRegisterSuccessState extends AuthState{
  String msg;
  AuthRegisterSuccessState({required this.msg});
}
class AuthRegisterErrorState extends AuthState{
  String error;
  AuthRegisterErrorState({required this.error});

}

class AuthLoginInitialState extends AuthState{}
class AuthLoginLoadingState extends AuthState{}
class AuthLoginSuccessState extends AuthState{}
class AuthLoginErrorState extends AuthState{
  String error;
  AuthLoginErrorState({required this.error});

}
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/my_navigator.dart';
import '../../../home/views/trending.dart';
import '../../data/models/user_model.dart';
import '../../data/repo/auth_repo.dart';
import '../../views/login.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthRegisterInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();


  final AuthRepo authRepo = AuthRepo();

  void onRegisterPressed() async {
    if (passwordController.text != confirmPasswordController.text) {
      emit(AuthRegisterErrorState(error: "Passwords do not match"));
      return;
    }

    emit(AuthRegisterLoadingState());
    var response = await authRepo.register(

        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        password: passwordController.text,

    );

    response.fold(
          (String error) {
        emit(AuthRegisterErrorState(error: error));
      },
          (r) {
        emit(AuthRegisterSuccessState(msg: r));
        MyNavigator.navigateTo(screen: LoginView());
      },
    );
  }

  void onLoginPressed() async {
    emit(AuthLoginLoadingState());

    var response =await authRepo.login(
      email: loginEmailController.text,
      password: loginPasswordController.text,
    );

    response.fold(
          (String error) {
        emit(AuthLoginErrorState(error: error));
      },
          (UserModel user) {
        emit(AuthLoginSuccessState());
        MyNavigator.navigateTo(screen: HomeView());
      },
    );
  }
}

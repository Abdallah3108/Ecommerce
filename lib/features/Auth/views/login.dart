import 'package:ecommerceapp/core/utils/app_assets.dart';
import 'package:ecommerceapp/core/utils/app_colors.dart';
import 'package:ecommerceapp/core/widgets/custom_started_button.dart';
import 'package:ecommerceapp/core/widgets/custom_text_form.dart';
import 'package:ecommerceapp/features/Auth/manager/auth_cubit/auth_cubit.dart';
import 'package:ecommerceapp/features/Auth/manager/auth_cubit/auth_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../home/views/trending.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoginSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login Successful')),
            );


            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomeView()),
            );
          } else if (state is AuthLoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          final cubit = AuthCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: SvgPicture.asset(AppAssets.arrowBack),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 40, left: 32, right: 32),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Welcome\nBack!',
                      style: TextStyle(
                        fontFamily: 'montserrat',
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomTextForm(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email),
                    controller: cubit.loginEmailController,
                  ),
                  SizedBox(height: 20),
                  ValueListenableBuilder<bool>(
                    valueListenable: _obscurePassword,
                    builder: (context, value, _) {
                      return CustomTextForm(
                        controller: cubit.loginPasswordController,
                        hintText: 'Password',
                        obscureText: value,
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            value ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: () {
                            _obscurePassword.value = !value;
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 50),
                  state is AuthLoginLoadingState
                      ? CircularProgressIndicator()
                      : SizedBox(
                    width: double.infinity,
                    child: CustomStartedButton(
                      backgroundColor: AppColors.stylish,
                      text: 'Login',
                      textColor: Colors.white,
                      onPressed: cubit.onLoginPressed,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:ecommerceapp/features/Auth/manager/auth_cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/custom_started_button.dart';
import '../../../core/widgets/custom_text_form.dart';
import '../manager/auth_cubit/auth_cubit.dart';
import 'login.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset(AppAssets.arrowBack),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Builder(
          builder: (context) {
            final cubit = AuthCubit.get(context);
            return SingleChildScrollView(
              padding: const EdgeInsets.only(top: 40, left: 32, right: 32),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Create an\naccount',
                        style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextForm(
                      hintText: "Full Name",
                      prefixIcon: Icon(Icons.person),
                      controller: cubit.nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextForm(
                      hintText: "Phone",
                      prefixIcon: Icon(Icons.phone),
                      controller: cubit.phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextForm(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email),
                      controller: cubit.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!RegExp(r'^[\w-\.]+@gmail\.com$')
                            .hasMatch(value)) {
                          return 'Email must have @gmail.com';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ValueListenableBuilder<bool>(
                      valueListenable: _obscurePassword,
                      builder: (context, value, _) {
                        return CustomTextForm(
                          controller: cubit.passwordController,
                          hintText: 'Password',
                          obscureText: value,
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(value
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              _obscurePassword.value = !value;
                            },
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    ValueListenableBuilder<bool>(
                      valueListenable: _obscurePassword,
                      builder: (context, value, _) {
                        return CustomTextForm(
                          controller: cubit.confirmPasswordController,
                          hintText: 'Confirm Password',
                          obscureText: value,
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(value
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              _obscurePassword.value = !value;
                            },
                          ),
                          validator: (value) {
                            if (value != cubit.passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text.rich(
                        TextSpan(
                          text: 'By clicking the ',
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: 'Register',
                              style: TextStyle(
                                color: AppColors.stylish,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: ' button, you agree\nto the public offer',
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthRegisterSuccessState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.msg)),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginView(),
                            ),
                          );
                        } else if (state is AuthRegisterErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.error)),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthRegisterLoadingState) {
                          return CircularProgressIndicator();
                        } else {
                          return SizedBox(
                            width: double.infinity,
                            child: CustomStartedButton(
                              backgroundColor: AppColors.stylish,
                              text: 'Create Account',
                              textColor: Colors.white,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  cubit.onRegisterPressed();
                                }
                              },
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

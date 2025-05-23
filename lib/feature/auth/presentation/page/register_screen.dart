import 'dart:developer';

import 'package:bookia/core/extentions/extentions.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/core/widgets/input_field.dart';
import 'package:bookia/feature/auth/data/models/request/auth_params.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cupit.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_states.dart';
import 'package:bookia/feature/auth/presentation/page/login_screen.dart';
import 'package:bookia/feature/intro/welcome_screen.dart';
import 'package:bookia/feature/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

bool isVisble = true;

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: ArrowBack(
          onPressed: () {
            context.pushReplacement(const WelcomeScreen());
          },
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccessState) {
              Navigator.pop(context);
              log("Success");
              context.pushAndRemoveUntil(const MainScreen());
            } else if (state is AuthErrorState) {
              Navigator.pop(context);
              showToast(context, state.error);
            } else if (state is AuthLoadingState) {
              showLoadingDialog(context);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      "Welcome back! Glad to see you, Again!",
                      style: getHeadLineTextStyle(context),
                    ),
                    const Gap(32),
                    InputField(
                      controller: usernameController,
                      hint: "Username",
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Username is required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(11),
                    InputField(
                      controller: emailController,
                      hint: "Email",
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Email is required";
                        } else if (!RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                            .hasMatch(p0)) {
                          return "Enter valid email";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(11),
                    InputField(
                      controller: passwordController,
                      hint: "Password",
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Password is required";
                        } else if (p0.length < 6) {
                          return "Password must be at least 6 characters";
                        } else {
                          return null;
                        }
                      },
                      isPasword: isVisble,
                      visibleIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisble = !isVisble;
                            });
                          },
                          icon: Icon(
                              color: AppColors.greyColor,
                              isVisble
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                    ),
                    const Gap(11),
                    InputField(
                      controller: confirmPasswordController,
                      hint: "Confirm password",
                      validator: (p1) {
                        if (p1!.isEmpty) {
                          return "Password is required";
                        } else if (p1.length < 6) {
                          return "Password must be at least 6 characters";
                        } else if (p1 != passwordController.text) {
                          return "Password does not match";
                        }
                        {
                          return null;
                        }
                      },
                      isPasword: isVisble,
                      visibleIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisble = !isVisble;
                            });
                          },
                          icon: Icon(
                              color: AppColors.greyColor,
                              isVisble
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                    ),
                    const Gap(30),
                    CustomButton(
                        text: "Register",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().register(
                                  AuthParams(
                                    name: usernameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    passwordConfirmation:
                                        confirmPasswordController.text,
                                  ),
                                );
                          }
                        }),
                  ],
                ),
              ),
            ),
          )),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account?",
            style: getSmallTextStyle(context, fontSize: 15),
          ),
          TextButton(
              onPressed: () {
                context.pushReplacement(const LoginScreen());
              },
              child: Text(
                "Login Now",
                style: getSmallTextStyle(context,
                    fontSize: 15, color: AppColors.primaryColor),
              ))
        ],
      ),
    );
  }
}

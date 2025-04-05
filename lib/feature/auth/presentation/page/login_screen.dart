import 'dart:developer';

import 'package:bookia/core/constans/app_assets.dart';
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
import 'package:bookia/feature/auth/presentation/page/forget_screen.dart';
import 'package:bookia/feature/auth/presentation/page/register_screen.dart';
import 'package:bookia/feature/auth/presentation/widget/scial_widget.dart';
import 'package:bookia/feature/intro/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool isVisble = true;

class _LoginScreenState extends State<LoginScreen> {
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
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            Navigator.pop(context);
            log("Success");
          } else if (state is AuthErrorState) {
            Navigator.pop(context);
            showError(context, state.error);
          } else if (state is AuthLoadingState) {
            showLoadingDialog(context);
          }
        },
        builder: (context, state) {
          var cubit = context.read<AuthCubit>();
          return Padding(
            padding: const EdgeInsets.all(22),
            child: SingleChildScrollView(
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    Text(
                      "Welcome back! Glad to see you, Again!",
                      style: getHeadLineTextStyle(context),
                    ),
                    const Gap(32),
                    InputField(
                      controller: cubit.emailController,
                      hint: "Enter your email",
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Email is required";
                        } else if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(p0)) {
                          return "Enter valid email";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(15),
                    InputField(
                      controller: cubit.passwordController,
                      hint: "Enter your password",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              context.pushTo(const ForgetScreen());
                            },
                            child: Text(
                              "Forgot Password?",
                              style: getSmallTextStyle(context,
                                  fontSize: 15, color: AppColors.primaryColor),
                            )),
                      ],
                    ),
                    const Gap(62),
                    CustomButton(
                        text: "Login",
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.login(AuthParams(
                              email: cubit.emailController.text,
                              password: cubit.passwordController.text,
                            ));
                          }
                          log("Login");

                      
                        }),
                    const Gap(34),
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Text("Or Login with",
                            style: getSmallTextStyle(context,
                                color: AppColors.darkGreyColor)),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    const Gap(21),
                    Row(
                      children: [
                        Expanded(
                            child: ScialWidget(
                                social: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SvgPicture.asset(AppAssets.facebook),
                        ))),
                        const Gap(8),
                        Expanded(
                            child: ScialWidget(
                                social: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SvgPicture.asset(AppAssets.google),
                        ))),
                        const Gap(8),
                        Expanded(
                            child: ScialWidget(
                                social: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SvgPicture.asset(AppAssets.apple),
                        ))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?",
            style: getSmallTextStyle(context, fontSize: 15),
          ),
          TextButton(
              onPressed: () {
                context.pushReplacement(const RegisterScreen());
              },
              child: Text(
                "Register Now",
                style: getSmallTextStyle(context,
                    fontSize: 15, color: AppColors.primaryColor),
              ))
        ],
      ),
    );
  }
}

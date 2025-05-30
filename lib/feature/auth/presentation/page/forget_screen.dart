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
import 'package:bookia/feature/auth/presentation/page/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: ArrowBack(
          onPressed: () {
            context.pushReplacement(const LoginScreen());
          },
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            Navigator.pop(context);
            log("success");
            context.pushTo(const VerificationScreen());
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forgot your password?",
                    style: getHeadLineTextStyle(context),
                  ),
                  const Gap(10),
                  Text(
                    "Don't worry! It occurs. Please enter the email address linked with your account.",
                    style: getBodyTextStyle(context,
                        fontSize: 16, color: AppColors.greyColor),
                  ),
                  const Gap(30),
                  InputField(
                    controller: emailController,
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
                  const Gap(38),
                  CustomButton(
                    text: "Send Code",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().forgetPassword(
                            AuthParams(email: emailController.text));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Remember Password?",
            style: getSmallTextStyle(context, fontSize: 15),
          ),
          TextButton(
              onPressed: () {
                context.pushReplacement(const LoginScreen());
              },
              child: Text(
                "Login",
                style: getSmallTextStyle(context,
                    fontSize: 15, color: AppColors.primaryColor),
              ))
        ],
      ),
    );
  }
}

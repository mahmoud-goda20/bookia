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
import 'package:bookia/feature/auth/presentation/page/password_changed_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class NewpasswordScreen extends StatefulWidget {
  const NewpasswordScreen({super.key});

  @override
  State<NewpasswordScreen> createState() => _NewpasswordScreen();
}

class _NewpasswordScreen extends State<NewpasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

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
            context.pushReplacement(const PasswordchangedScreen());
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
                    "Create new password",
                    style: getHeadLineTextStyle(context),
                  ),
                  const Gap(10),
                  Text(
                    "Your new password must be unique from those previously used.",
                    style: getBodyTextStyle(context,
                        fontSize: 16, color: AppColors.greyColor),
                  ),
                  const Gap(30),
                  InputField(
                    controller: newPasswordController,
                    hint: "New Password",
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
                  const Gap(18),
                  InputField(
                    controller: confirmController,
                    hint: "Confirm password",
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
                  const Gap(38),
                  CustomButton(
                    text: "Reset Password",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().restPassword(AuthParams(
                            verificationCode: AuthCubit.otpCode,
                            newPassword: newPasswordController.text,
                            newPasswordConfirmation: confirmController.text));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

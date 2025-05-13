import 'dart:developer';

import 'package:bookia/core/extentions/extentions.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/feature/auth/data/models/request/auth_params.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cupit.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_states.dart';
import 'package:bookia/feature/auth/presentation/page/forget_screen.dart';
import 'package:bookia/feature/auth/presentation/page/new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController otpController = TextEditingController();

  bool isCompleted() {
    return otpController.text.length == 6;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: ArrowBack(
          onPressed: () {
            context.pushReplacement(const ForgetScreen());
          },
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            Navigator.pop(context);
            log("success");
            context.pushReplacement(const NewpasswordScreen());
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "OTP Verification",
                  style: getHeadLineTextStyle(context),
                ),
                const Gap(10),
                Text(
                  "Enter the verification code we just sent on your email address.",
                  style: getBodyTextStyle(context,
                      fontSize: 16, color: AppColors.greyColor),
                ),
                const Gap(30),
                Pinput(
                  length: 6,
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  defaultPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: getHeadLineTextStyle(context,
                        fontSize: 30, color: AppColors.darkColor),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.darkColor),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: getHeadLineTextStyle(context,
                        fontSize: 30, color: AppColors.darkColor),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                  ),
                  submittedPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: getHeadLineTextStyle(context,
                        fontSize: 30, color: AppColors.darkColor),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: AppColors.primaryColor, width: 2),
                    ),
                  ),
                ),
                const Gap(38),
                CustomButton(
                  text: "Verify",
                  onPressed: () {
                    if (isCompleted()) {
                      AuthCubit.otpCode = int.parse(otpController.text);
                      context.read<AuthCubit>().checkForgetPassword(AuthParams(
                            verificationCode: AuthCubit.otpCode,
                          ));
                    } else {
                      showToast(context, "Please enter a valid code");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Didn’t received code?",
            style: getSmallTextStyle(context, fontSize: 15),
          ),
          TextButton(
              onPressed: () {
                context.pushReplacement(const ForgetScreen());
              },
              child: Text(
                "Resend",
                style: getSmallTextStyle(context,
                    fontSize: 15, color: AppColors.primaryColor),
              ))
        ],
      ),
    );
  }
}

import 'package:bookia/core/extentions/extentions.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/feature/auth/presentation/page/forget_screen.dart';
import 'package:bookia/feature/auth/presentation/page/login_screen.dart';
import 'package:bookia/feature/auth/presentation/page/newPassword_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

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
      body: Padding(
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
                    border: Border.all(color: AppColors.primaryColor, width: 2),
                  ),
                ),
                onCompleted: (pin) => print("complete: $pin"),
              ),
              const Gap(38),
              CustomButton(
                text: "Verify",
                onPressed: () {
                  context.pushReplacement(const NewpasswordScreen());
                },
              ),
            ],
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
                context.pushReplacement(const LoginScreen());
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

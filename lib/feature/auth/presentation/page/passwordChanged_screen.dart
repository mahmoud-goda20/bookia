import 'package:bookia/core/constans/app_assets.dart';
import 'package:bookia/core/extentions/extentions.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/feature/auth/presentation/page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class PasswordchangedScreen extends StatelessWidget {
  const PasswordchangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.success),
              const Gap(35),
              Text(
                "Password Changed!",
                style: getHeadLineTextStyle(context),
              ),
              const Gap(10),
              Text(
                "Your password has been changed successfully.",
                style: getBodyTextStyle(context,
                    fontSize: 16, color: AppColors.greyColor),
              ),
              const Gap(40),
              CustomButton(
                text: "Back to Login",
                onPressed: () {
                  context.pushReplacement(const LoginScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

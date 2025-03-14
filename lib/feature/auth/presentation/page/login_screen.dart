import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const ArrowBack(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Text(
              "Welcome back! Glad to see you, Again!",
              style: getHeadLineTextStyle(context),
            ),
            const Gap(32),
            TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.borderColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.borderColor)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.redColor)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.redColor)),
                  fillColor: AppColors.accentColor,
                  filled: true,
                  hintText: "Enter your email",
                  hintStyle: getSmallTextStyle(context,
                      fontSize: 15, color: AppColors.greyColor)),
            ),
          ],
        ),
      ),
    );
  }
}

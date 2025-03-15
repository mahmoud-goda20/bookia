import 'package:bookia/core/extentions/extentions.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/input_field.dart';
import 'package:bookia/feature/auth/presentation/page/login_screen.dart';
import 'package:bookia/feature/auth/presentation/page/passwordChanged_screen.dart';
import 'package:bookia/feature/auth/presentation/page/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewpasswordScreen extends StatefulWidget {
  const NewpasswordScreen({super.key});

  @override
  State<NewpasswordScreen> createState() => _NewpasswordScreen();
}

class _NewpasswordScreen extends State<NewpasswordScreen> {
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
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
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
                        isVisble ? Icons.visibility_off : Icons.visibility)),
              ),
              const Gap(18),
              InputField(
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
                        isVisble ? Icons.visibility_off : Icons.visibility)),
              ),
              const Gap(38),
              CustomButton(
                text: "Reset Password",
                onPressed: () {
                  context.pushReplacement(const PasswordchangedScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

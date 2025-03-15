import 'package:bookia/core/extentions/extentions.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/input_field.dart';
import 'package:bookia/feature/auth/presentation/page/login_screen.dart';
import 'package:bookia/feature/intro/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

bool isVisble = true;

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title:  ArrowBack(onPressed: () {
          context.pushReplacement(const WelcomeScreen());
        },),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Welcome back! Glad to see you, Again!",
                style: getHeadLineTextStyle(context),
              ),
              const Gap(32),
              InputField(
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
                hint: "Email",
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return "Email is required";
                  } else if (RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(p0)) {
                    return "Enter valid email";
                  } else {
                    return null;
                  }
                },
              ),
              const Gap(11),
              InputField(
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
                        isVisble ? Icons.visibility_off : Icons.visibility)),
              ),
              const Gap(11),
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
              const Gap(30),
              CustomButton(text: "Register", onPressed: () {}),
            ],
          ),
        ),
      ),
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

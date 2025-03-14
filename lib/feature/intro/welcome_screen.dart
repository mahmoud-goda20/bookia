import 'package:bookia/core/constans/app_assets.dart';
import 'package:bookia/core/extentions/extentions.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/feature/auth/presentation/page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.welcome,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  SvgPicture.asset(
                    AppAssets.logo,
                  ),
                  const Gap(28),
                  Text("Order Your Book Now!",
                      style: getBodyTextStyle(context, fontSize: 20)),
                  const Spacer(
                    flex: 4,
                  ),
                  CustomButton(
                      text: "Login",
                      onPressed: () {
                        context.pushReplacement(const LoginScreen());
                      }),
                  const Gap(15),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: AppColors.darkColor),
                          backgroundColor: AppColors.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Register",
                          style: getSmallTextStyle(context,
                              color: AppColors.darkColor, fontSize: 15),
                        )),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

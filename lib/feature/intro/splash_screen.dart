import 'package:bookia/core/constans/app_assets.dart';
import 'package:bookia/core/extentions/extentions.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/intro/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    //   bool isUploaded =
    //       AppLocalStorage.getCachedData(AppLocalStorage.isUploaded) ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      //     if (isUploaded) {
      //       context.pushReplacement(const HomeScreen());
      //     } else {
      context.pushReplacement(const WelcomeScreen());
      //     }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.logo,
            ),
            const Gap(9),
            Text(
              "Order Your Book Now!",
              style: getBodyTextStyle(
                context,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showError(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: AppColors.redColor,
      content: Text(
        message,
        style: getSmallTextStyle(context, color: AppColors.whiteColor),
      )));
}

showLoadingDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    barrierColor: AppColors.darkColor.withOpacity(0.7),
    context: context,
    builder: (context) => Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Lottie.asset(
        'assets/images/loading.json',
      ),
    ])),
  );
}

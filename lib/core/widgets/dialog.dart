import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';


showError(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: AppColors.redColor,
      content: Text(
        message,
        style: getBodyTextStyle(context, color: AppColors.whiteColor),
      )));
}

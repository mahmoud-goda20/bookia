import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
  });
  final String text;
  final Function() onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 56,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: onPressed,
          child: Text(
            text,
            style: getSmallTextStyle(context,
                color: AppColors.whiteColor, fontSize: 15),
          )),
    );
  }
}

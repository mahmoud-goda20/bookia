import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
   InputField({
    super.key,
    required this.hint,
    this.isPasword ,
    this.visibleIcon,
    this.validator,
  });
  String hint;
  bool? isPasword ;
  Widget? visibleIcon;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validator ,
      obscureText: isPasword??false,
      decoration: InputDecoration(
        suffixIcon:visibleIcon ,
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
          hintText: hint,
          hintStyle: getSmallTextStyle(context,
              fontSize: 15, color: AppColors.greyColor)),
    );
  }
}

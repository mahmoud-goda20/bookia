import 'package:bookia/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ScialWidget extends StatelessWidget {
  const ScialWidget({
    super.key,
    required this.social,
  });
  final Widget social;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 105,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: social,
      ),
    );
  }
}

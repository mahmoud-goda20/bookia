import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/input_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ArrowBack(onPressed: () {
          Navigator.pop(context);
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(15),
            Stack(children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: AppColors.greyColor,
              ),
              Positioned(
                right: 5,
                bottom: 10,
                child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.whiteColor),
                    child: SvgPicture.asset("assets/icons/camera.svg")),
              ),
            ]),
            const Spacer(
              flex: 1,
            ),
            const InputField(
              hint: "Full Name",
            ),
            const Gap(15),
            const InputField(
              hint: "Email",
            ),
            const Gap(15),
            const InputField(
              hint: "Phone Number",
            ),
            const Spacer(
              flex: 3,
            ),
            CustomButton(text: "Update Profile", onPressed: () {})
          ],
        ),
      ),
    );
  }
}

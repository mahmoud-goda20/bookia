import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UpdatePassword extends StatelessWidget {
  const UpdatePassword({super.key});

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
            Text(
              "New Password",
              style: getHeadLineTextStyle(context),
            ),
            const Spacer(
              flex: 1,
            ),
            const InputField(hint: "Current Password"),
            const Gap(30),
            const InputField(hint: "New Password"),
            const Gap(30),
            const InputField(
              hint: "Confirm Password",
              isPasword: true,
            ),
            const Spacer(
              flex: 3,
            ),
            CustomButton(text: "Update Password", onPressed: () {})
          ],
        ),
      ),
    );
  }
}

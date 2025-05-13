import 'package:bookia/core/extentions/extentions.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia/feature/profile/presentation/cubit/profile_state.dart';
import 'package:bookia/feature/profile/presentation/page/edit_profile_screen.dart';
import 'package:bookia/feature/profile/presentation/page/update_password_screen.dart';
import 'package:bookia/feature/profile/presentation/widget/tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      var cubit = context.read<ProfileCubit>();
      if (state is ProfileLoaded) {
        return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Profile',
                style: getTitleTextStyle(context),
              ),
              actions: [
                IconButton(
                  icon: SvgPicture.asset("assets/icons/Logout.svg"),
                  onPressed: () {
                    // Handle logout action
                  },
                ),
              ]),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColors.greyColor,
                    ),
                    const Gap(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cubit.profileResponse?.data?.name ?? "",
                          style: getBodyTextStyle(context, fontSize: 20),
                        ),
                        const Gap(5),
                        Text(
                          cubit.profileResponse?.data?.email ?? "",
                          style: getSmallTextStyle(context),
                        ),
                      ],
                    )
                  ],
                ),
                const Gap(30),
                Tile(onTap: () {}, title: 'My Orders'),
                const Gap(10),
                Tile(
                    onTap: () {
                      context.pushTo(const EditProfile());
                    },
                    title: 'Edit Profile'),
                const Gap(10),
                Tile(
                    onTap: () {
                      context.pushTo(const UpdatePassword());
                    },
                    title: 'Reset Password'),
                const Gap(10),
                Tile(onTap: () {}, title: 'FAQ'),
                const Gap(10),
                Tile(onTap: () {}, title: 'Contact Us'),
                const Gap(10),
                Tile(onTap: () {}, title: 'Privacy & Terms'),
              ],
            ),
          ),
        );
      } else if (state is ProfileLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return const Center(
          child: Text('Error loading profile'),
        );
      }
    });
  }
}

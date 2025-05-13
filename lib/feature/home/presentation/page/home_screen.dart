import 'package:bookia/core/extentions/extentions.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/page/book_search_screen.dart';
import 'package:bookia/feature/home/presentation/widget/home_slider.dart';
import 'package:bookia/feature/home/presentation/widget/popular_boks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getBestSeller()
        ..getSliders(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: SvgPicture.asset(
            "assets/images/logo.svg",
            height: 30,
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.pushTo(const BookSearch());
              },
              icon: SvgPicture.asset(
                "assets/icons/search.svg",
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/notification.svg",
              ),
            ),
          ],
        ),
        body: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeSlider(),
              Gap(10),
              PopularBoks(),
            ],
          ),
        ),
      ),
    );
  }
}

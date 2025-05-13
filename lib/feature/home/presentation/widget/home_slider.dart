import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/cubit/home_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({
    super.key,
  });

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeSliderLoaded ||
          current is HomeSliderLoading ||
          current is HomeSliderError,
      builder: (context, state) {
        if (state is HomeSliderLoaded) {
          var sliders = context.read<HomeCubit>().sliders?.data?.sliders ?? [];
          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: 3,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: sliders[itemIndex].image ?? "",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                options: CarouselOptions(
                  height: 150,
                  viewportFraction: 0.9,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const Gap(10),
              SmoothPageIndicator(
                  controller: PageController(initialPage: currentIndex),
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.primaryColor,
                    dotColor: Colors.grey,
                    dotHeight: 7,
                    dotWidth: 7,
                    spacing: 5,
                    expansionFactor: 6,
                  ),
                  onDotClicked: (index) {})
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

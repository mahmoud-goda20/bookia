import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/feature/home/data/models/best_seller_books/product.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/cubit/home_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.book});

  final Product book;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeAddToWishlistCartSuccess) {
            Navigator.pop(context);
            Navigator.pop(context);
            showToast(context, state.message, DialogType.success);
          } else if (state is HomeAddToWishlisCarttError) {
            Navigator.pop(context);
            showToast(context, state.error);
          } else if (state is HomeAddToWishlistCartLoading) {
            showLoadingDialog(context);
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: ArrowBack(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                onPressed: () {
                  context.read<HomeCubit>().addToWishlist(book.id ?? 0);
                },
                icon: SvgPicture.asset(
                  "assets/icons/Bookmark.svg",
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Hero(
                            tag: book.id ?? "",
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: CachedNetworkImage(
                                imageUrl: book.image ?? "",
                                height: 270,
                              ),
                            ),
                          ),
                        ),
                        const Gap(30),
                        Text(
                          book.name ?? "",
                          textAlign: TextAlign.center,
                          style: getTitleTextStyle(context),
                        ),
                        const Gap(15),
                        Text(
                          book.category ?? "",
                          style: getBodyTextStyle(context,
                              color: AppColors.primaryColor),
                        ),
                        const Gap(15),
                        Text(
                          book.description ?? "",
                          textAlign: TextAlign.justify,
                          style: getSmallTextStyle(context),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${book.price.toString()} \$",
                        style: getTitleTextStyle(context),
                      ),
                      CustomButton(
                          color: AppColors.darkColor,
                          width: 200,
                          text: "Add To Cart",
                          onPressed: () {
                            context.read<HomeCubit>().addToCart(
                                  book.id ?? 0,
                                );
                            showLoadingDialog(context);
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

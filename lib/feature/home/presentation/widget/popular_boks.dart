import 'package:bookia/core/extentions/extentions.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/feature/home/data/models/best_seller_books/product.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/cubit/home_state.dart';
import 'package:bookia/feature/home/presentation/page/book_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PopularBoks extends StatelessWidget {
  const PopularBoks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is BestSellerLoaded ||
          current is BestSellerLoading ||
          current is BestSellerError,
      builder: (context, state) {
        if (state is BestSellerLoaded) {
          var books =
              context.read<HomeCubit>().bestSellerBooks?.data?.products ?? [];
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Popular Books", style: getTitleTextStyle(context)),
                const Gap(10),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 270),
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return BookItem(book: books[index]);
                    }),
              ],
            ),
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

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
    required this.book,
  });

  final Product book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushTo(BookDetailsScreen(book: book));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: book.id ?? "",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: book.image ?? "",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorWidget: (context, url, error) {
                      return const Center(child: Icon(Icons.error));
                    },
                  ),
                ),
              ),
            ),
            const Gap(10),
            Text(
              book.name ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: getBodyTextStyle(context),
            ),
            const Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${book.price.toString()} \$",
                  style: getBodyTextStyle(context, fontSize: 16),
                ),
                CustomButton(
                    color: AppColors.darkColor,
                    height: 30,
                    width: 80,
                    text: "Buy",
                    onPressed: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}

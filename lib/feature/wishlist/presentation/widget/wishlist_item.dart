import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/feature/home/data/models/best_seller_books/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WishlistItem extends StatelessWidget {
  const WishlistItem({
    super.key,
    required this.book,
    required this.onRemove,
    required this.onAddToCart,
  });

  final Product book;

  final Function() onRemove;

  final Function() onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: book.image ?? "",
              height: 120,
              width: 100,
            )),
        const Gap(20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      book.name ?? "",
                      style: getBodyTextStyle(context),
                    ),
                  ),
                  IconButton(
                      onPressed: onRemove,
                      icon: const Icon(Icons.cancel_outlined)),
                ],
              ),
              Text(
                "${book.price.toString()} \$",
                style: getBodyTextStyle(context, fontSize: 16),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                      width: 170,
                      height: 40,
                      text: "Add To Cart",
                      onPressed: onAddToCart),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

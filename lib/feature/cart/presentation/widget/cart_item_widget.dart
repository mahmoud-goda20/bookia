import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/cart/data/models/get_cart_response/cart_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.book,
    required this.onDelete,
    required this.onAdd,
    required this.onRemove,
  });

  final CartItem book;

  final Function() onDelete;
  final Function() onAdd;
  final Function() onRemove;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: book.itemProductImage ?? "",
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
                      book.itemProductName ?? "",
                      style: getBodyTextStyle(context),
                    ),
                  ),
                  IconButton(
                      onPressed: onDelete,
                      icon: const Icon(Icons.cancel_outlined)),
                ],
              ),
              Text(
                "${book.itemProductPrice.toString()} \$",
                style: getBodyTextStyle(context, fontSize: 16),
              ),
              const Gap(10),
              Row(
                children: [
                  FloatingActionButton.small(
                    onPressed: onAdd,
                    backgroundColor: AppColors.accentColor,
                    elevation: 0,
                    child: const Icon(
                      Icons.add,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    book.itemQuantity.toString(),
                    style: getBodyTextStyle(context, fontSize: 16),
                  ),
                  const Gap(10),
                  FloatingActionButton.small(
                    onPressed: onRemove,
                    backgroundColor: AppColors.accentColor,
                    elevation: 0,
                    child: const Icon(
                      Icons.remove,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

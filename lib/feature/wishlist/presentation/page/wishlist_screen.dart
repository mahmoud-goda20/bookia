import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:bookia/feature/wishlist/presentation/widget/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistCubit()..getWishlist(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Wishlist',
            style: getTitleTextStyle(context),
          ),
        ),
        body: BlocConsumer<WishlistCubit, WishlistState>(
            listener: (context, state) {
          if (state is AddToCartLoaded) {
            Navigator.pop(context);
            showToast(context, "Added to Cart", DialogType.success);
          } else if (state is AddToCartError) {
            Navigator.pop(context);
            showToast(context, state.error);
          } else if (state is AddToCartLoading) {
            showLoadingDialog(context);
          }
        }, builder: (context, state) {
          if (state is WishlistLoaded ||
              state is AddToCartLoading ||
              state is AddToCartError ||
              state is AddToCartLoaded) {
            var bookList =
                context.read<WishlistCubit>().wishlistResponse?.data?.data ??
                    [];
            return bookList.isEmpty
                ? Center(
                    child: Text("No Items in Wishlist",
                        style: getSmallTextStyle(
                          context,
                        )),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(20),
                    separatorBuilder: (context, index) => const Divider(
                          height: 30,
                        ),
                    itemCount: bookList.length,
                    itemBuilder: (context, index) {
                      return WishlistItem(
                        book: bookList[index],
                        onAddToCart: () {
                          context
                              .read<WishlistCubit>()
                              .addToCart(bookList[index].id ?? 0);
                        },
                        onRemove: () {
                          context
                              .read<WishlistCubit>()
                              .removeFromWishlist(bookList[index].id ?? 0);
                        },
                      );
                    });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}

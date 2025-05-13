import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_state.dart';
import 'package:bookia/feature/cart/presentation/widget/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Cart',
            style: getTitleTextStyle(context),
          ),
        ),
        body: BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is CartLoaded) {
                var bookList =
                    context.read<CartCubit>().cartResponse?.data?.cartItems ??
                        [];
                var totalPrice =
                    context.read<CartCubit>().cartResponse?.data?.total ?? 0;
                return bookList.isEmpty
                    ? Center(
                        child: Text("No Items in Cart",
                            style: getSmallTextStyle(
                              context,
                            )),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const Divider(
                                        height: 30,
                                      ),
                                  itemCount: bookList.length,
                                  itemBuilder: (context, index) {
                                    return CartItemWidget(
                                      book: bookList[index],
                                      onDelete: () {
                                        context
                                            .read<CartCubit>()
                                            .removeFromCart(
                                                bookList[index].itemId ?? 0);
                                      },
                                      onAdd: () {
                                        if ((bookList[index].itemQuantity ??
                                                0) <
                                            (bookList[index].itemProductStock ??
                                                0)) {
                                          context.read<CartCubit>().updateCart(
                                              bookList[index].itemId ?? 0,
                                              (bookList[index].itemQuantity ??
                                                      0) +
                                                  1);
                                        } else {
                                          showToast(context, "Cannot add more");
                                        }
                                      },
                                      onRemove: () {
                                        if ((bookList[index].itemQuantity ??
                                                0) >
                                            1) {
                                          context.read<CartCubit>().updateCart(
                                              bookList[index].itemId ?? 0,
                                              (bookList[index].itemQuantity ??
                                                      0) -
                                                  1);
                                        } else {
                                          showToast(
                                              context, "Cannot remove more");
                                        }
                                      },
                                    );
                                  }),
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total",
                                      style: getBodyTextStyle(context),
                                    ),
                                    Text(
                                      "$totalPrice \$",
                                      style: getBodyTextStyle(context),
                                    ),
                                  ],
                                ),
                                const Gap(20),
                                CustomButton(text: "Checkout", onPressed: () {})
                              ],
                            )
                          ],
                        ),
                      );
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

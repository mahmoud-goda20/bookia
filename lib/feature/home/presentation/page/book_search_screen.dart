import 'package:bookia/core/extentions/extentions.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';

import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:bookia/core/widgets/input_field.dart';

import 'package:bookia/feature/home/data/models/best_seller_books/product.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/cubit/home_state.dart';
import 'package:bookia/feature/home/presentation/page/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BookSearch extends StatelessWidget {
  const BookSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Row(
          children: [
            const Gap(10),
            ArrowBack(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        title: InputField(hint: "Search", controller: searchController),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg"),
            onPressed: () {
              context.read<HomeCubit>().search(
                    searchController.text,
                  );
            },
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeSearchLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeSearchSuccess) {
            List<Product> products =
                context.read<HomeCubit>().searchResponse?.data?.products ??
                    [];
            return products.isEmpty
                ? Center(
                    child: Text(
                    "No products found",
                    style: getSmallTextStyle(context),
                  ))
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          context.pushTo(BookDetailsScreen(book: product));
                        },
                        child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.accentColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    product.image ?? "",
                                    height: 120,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Gap(10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            product.name ?? "",
                                            style: getBodyTextStyle(context),
                                          )),
                                        ],
                                      ),
                                      const Gap(10),
                                      Text(
                                        "${product.priceAfterDiscount} \$",
                                        style: getBodyTextStyle(context,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      );
                    },
                  );
          } else if (state is HomeSearchError) {
            return Center(child: Text(state.error));
          }
          return const Center(child: Text("Start typing to search..."));
        },
      ),
    );
  }
}

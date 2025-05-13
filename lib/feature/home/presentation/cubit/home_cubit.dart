import 'package:bookia/feature/cart/data/repo/cart_repo.dart';
import 'package:bookia/feature/home/data/models/best_seller_books/best_seller_books.dart';
import 'package:bookia/feature/home/data/models/search/search_response/search_response.dart';
import 'package:bookia/feature/home/data/models/sliders/sliders.dart';
import 'package:bookia/feature/home/data/repo/home_repo.dart';
import 'package:bookia/feature/home/presentation/cubit/home_state.dart';
import 'package:bookia/feature/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInital());

  BestSellerBooks? bestSellerBooks;
  Sliders? sliders;
  SearchResponse? searchResponse;

  Future<void> getBestSeller() async {
    emit(BestSellerLoading());

    await HomeRepo.getBestSeller().then((value) {
      if (value != null) {
        bestSellerBooks = value;
        emit(BestSellerLoaded());
      } else {
        emit(BestSellerError("Error"));
      }
    }).catchError((error) {
      emit(BestSellerError(error.toString()));
    });
  }

  Future<void> getSliders() async {
    emit(HomeSliderLoading());

    await HomeRepo.getSliders().then((value) {
      if (value != null) {
        sliders = value;
        emit(HomeSliderLoaded());
      } else {
        emit(HomeSliderError("Error"));
      }
    }).catchError((error) {
      emit(HomeSliderError(error.toString()));
    });
  }

  Future<void> addToWishlist(int id) async {
    emit(HomeAddToWishlistCartLoading());

    await WishlistRepo.addToWishlist(id).then((value) {
      if (value == true) {
        emit(HomeAddToWishlistCartSuccess("Added to Wishlist"));
      } else {
        emit(HomeAddToWishlisCarttError("Error"));
      }
    }).catchError((error) {
      emit(HomeAddToWishlisCarttError(error.toString()));
    });
  }

  Future<void> addToCart(int id) async {
    emit(HomeAddToWishlistCartLoading());

    await CartRepo.addToCart(id).then((value) {
      if (value == true) {
        emit(HomeAddToWishlistCartSuccess("Added to Cart"));
      } else {
        emit(HomeAddToWishlisCarttError("Error"));
      }
    }).catchError((error) {
      emit(HomeAddToWishlisCarttError(error.toString()));
    });
  }

  Future<void> search(String query) async {
    emit(HomeSearchLoading());

    await HomeRepo.getSearch(query).then((value) {
      if (value != null) {
        searchResponse = value;
        emit(HomeSearchSuccess());
      } else {
        emit(HomeSearchError("Error"));
      }
    }).catchError((error) {
      emit(HomeSearchError(error.toString()));
    });
  }
}

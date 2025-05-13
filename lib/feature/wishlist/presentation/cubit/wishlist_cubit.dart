import 'package:bookia/feature/cart/data/repo/cart_repo.dart';
import 'package:bookia/feature/wishlist/data/models/get_wishlist_response/get_wishlist_rsponse.dart';
import 'package:bookia/feature/wishlist/data/repo/wishlist_repo.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  GetWishlistResponse? wishlistResponse;

  getWishlist() async {
    emit(WishlistLoading());

    await WishlistRepo.getWishlist().then((value) {
      if (value != null) {
        wishlistResponse = value;
        emit(WishlistLoaded());
      } else {
        emit(WishlistError("Error"));
      }
    }).catchError((error) {
      emit(WishlistError(error.toString()));
    });
  }

  removeFromWishlist(int id) async {
    emit(WishlistLoading());

    await WishlistRepo.removeFromWishlist(id).then((value) {
      if (value != null) {
        wishlistResponse = value;
        emit(WishlistLoaded());
      } else {
        emit(WishlistError("Error"));
      }
    }).catchError((error) {
      emit(WishlistError(error.toString()));
    });
  }

  Future<void> addToCart(int id) async {
    emit(AddToCartLoading());

    await CartRepo.addToCart(id).then((value) {
      if (value == true) {
        emit(AddToCartLoaded());
      } else {
        emit(AddToCartError("Error"));
      }
    }).catchError((error) {
      emit(AddToCartError(error.toString()));
    });
  }
}

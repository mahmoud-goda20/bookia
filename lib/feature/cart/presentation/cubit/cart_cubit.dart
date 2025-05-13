import 'package:bookia/feature/cart/data/models/get_cart_response/get_cart_response.dart';
import 'package:bookia/feature/cart/data/repo/cart_repo.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  GetCartResponse? cartResponse;

  getCart() async {
    emit(CartLoading());

    await CartRepo.getCart().then((value) {
      if (value != null) {
        cartResponse = value;
        emit(CartLoaded());
      } else {
        emit(CartError("Error"));
      }
    }).catchError((error) {
      emit(CartError(error.toString()));
    });
  }

  removeFromCart(int cartItemId) async {
    emit(CartLoading());

    await CartRepo.removeFromCart(cartItemId).then((value) {
      if (value != null) {
        cartResponse = value;
        emit(CartLoaded());
      } else {
        emit(CartError("Error"));
      }
    }).catchError((error) {
      emit(CartError(error.toString()));
    });
  }

  updateCart(int cartItemId, int quantity) async {
    emit(CartLoading());

    await CartRepo.updateCart(cartItemId, quantity).then((value) {
      if (value != null) {
        cartResponse = value;
        emit(CartLoaded());
      } else {
        emit(CartError("Error"));
      }
    }).catchError((error) {
      emit(CartError(error.toString()));
    });
  }
}

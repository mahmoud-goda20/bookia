class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {}

class WishlistError extends WishlistState {
  final String error;

  WishlistError(this.error);
}

class AddToCartLoading extends WishlistState {}

class AddToCartLoaded extends WishlistState {}

class AddToCartError extends WishlistState {
  final String error;

  AddToCartError(this.error);
}

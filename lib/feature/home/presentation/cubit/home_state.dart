class HomeState {}

class HomeInital extends HomeState {}

class BestSellerLoading extends HomeState {}

class BestSellerLoaded extends HomeState {}

class BestSellerError extends HomeState {
  final String error;
  BestSellerError(this.error);
}

class HomeSliderLoading extends HomeState {}

class HomeSliderLoaded extends HomeState {}

class HomeSliderError extends HomeState {
  final String error;
  HomeSliderError(this.error);
}

class HomeAddToWishlistCartLoading extends HomeState {}

class HomeAddToWishlistCartSuccess extends HomeState {
  final String message;
  HomeAddToWishlistCartSuccess(this.message);
}

class HomeAddToWishlisCarttError extends HomeState {
  final String error;
  HomeAddToWishlisCarttError(this.error);
}

class HomeSearchLoading extends HomeState {}

class HomeSearchSuccess extends HomeState {}

class HomeSearchError extends HomeState {
  final String error;
  HomeSearchError(this.error);
}

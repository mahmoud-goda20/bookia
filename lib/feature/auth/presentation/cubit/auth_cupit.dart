import 'package:bookia/core/services/local_helper.dart';
import 'package:bookia/feature/auth/data/models/request/auth_params.dart';
import 'package:bookia/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  static int? otpCode;

  register(AuthParams params) {
    emit(AuthLoadingState());
    AuthRepo.register(params).then((value) {
      if (value != null) {
        LocalHelper.cacheData(LocalHelper.tokenkey, value.data?.token);
        emit(AuthSuccessState());
      } else {
        emit(AuthErrorState(error: "Something went wrong"));
      }
    });
  }

  login(AuthParams params) {
    emit(AuthLoadingState());
    AuthRepo.login(params).then((value) {
      if (value != null) {
        LocalHelper.cacheData(LocalHelper.tokenkey, value.data?.token);
        emit(AuthSuccessState());
      } else {
        emit(AuthErrorState(error: "Something went wrong"));
      }
    });
  }

  forgetPassword(AuthParams params) {
    emit(AuthLoadingState());
    AuthRepo.forgetPassword(params).then((value) {
      if (value != null) {
        emit(AuthSuccessState());
      } else {
        emit(AuthErrorState(error: "Something went wrong"));
      }
    });
  }

  checkForgetPassword(AuthParams params) {
    emit(AuthLoadingState());
    AuthRepo.checkForgetPassword(params).then((value) {
      if (value != null && value.data?.user?.emailVerified != false) {
        emit(AuthSuccessState());
      } else {
        emit(AuthErrorState(error: "Something went wrong"));
      }
    });
  }

  restPassword(AuthParams params) {
    emit(AuthLoadingState());
    AuthRepo.restPassword(params).then((value) {
      if (value != null) {
        emit(AuthSuccessState());
      } else {
        emit(AuthErrorState(error: "Something went wrong"));
      }
    });
  }
}

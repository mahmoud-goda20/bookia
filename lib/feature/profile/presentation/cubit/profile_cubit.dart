import 'dart:developer';

import 'package:bookia/feature/profile/data/models/response/show_profile_response/show_profile_response.dart';
import 'package:bookia/feature/profile/data/repo/profile_repo.dart';
import 'package:bookia/feature/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  ShowProfileResponse? profileResponse;

  Future getProfile() async {
    emit(ProfileLoading());
    await ProfileRepo.getProfile().then((value) {
      profileResponse = value;
      if (value != null) {
        profileResponse = value;
        log("profile fetched successfully");
        emit(ProfileLoaded());
      } else {
        emit(ProfileError("Error fetching profile"));
      }
    });
  }
}

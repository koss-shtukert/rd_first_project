import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rd_first_project/lesson_22/data/repository/error/custom_server_error.dart';
import 'package:rd_first_project/lesson_22/data/repository/fake_user_repository.dart';
import 'package:rd_first_project/lesson_22/presentation/cubit/user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(this._repository) : super(UserProfileLoading());

  final FakeUserRepository _repository;

  Future<void> loadUserProfile({bool shouldFail = true}) async {
    emit(UserProfileLoading());

    try {
      final user = await _repository.getUserProfile(shouldFail);
      emit(UserProfileLoaded(user));
    } on CustomServerError catch (e) {
      emit(UserProfileError(e.message));
    } on Exception catch (e) {
      emit(UserProfileError('Невідома помилка: $e'));
    }
  }
}

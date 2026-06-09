import 'package:rd_first_project/lesson_22/data/repository/entity/user_entity.dart';
import 'package:rd_first_project/lesson_22/data/repository/error/custom_server_error.dart';

class FakeUserRepository {
  Future<UserEntity> getUserProfile(bool shouldFail) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    try {
      if (shouldFail) {
        throw Exception('Server is temporarily unavailable');
      }

      return UserEntity(id: '1', name: 'Test User');
    } on Exception catch (e) {
      throw CustomServerError(e.toString());
    }
  }
}

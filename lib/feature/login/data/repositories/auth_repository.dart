import 'package:todo_list/core/service/dio.dart';
import 'package:todo_list/core/utils/constants.dart';
import '../models/user.dart';

class AuthRepository {
  Future<User> login(
    String username,
    String password,
  ) async {
    try {
      final response = await postIt(
        '${AppConstant.baseUrl}/login',
        null,
        {
          'username': username,
          'password': password,
        },
      );

      return User.fromJson(response.data);
    } catch (e) {
      // Handle errors
      rethrow;
    }
  }

  Future<User> register(String email, String password, String username) async {
    try {
      final response = await postIt(
        '${AppConstant.baseUrl}register',
        null,
        {
          'email': email,
          'password': password,
          'username': username,
        },
      );

      return User.fromJson(response.data);
    } catch (e) {
      // Handle errors
      rethrow;
    }
  }
}

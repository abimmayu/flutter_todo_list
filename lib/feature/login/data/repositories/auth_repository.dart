import 'package:todo_list/core/service/dio.dart';
import 'package:todo_list/core/utils/constants.dart';
import 'package:todo_list/feature/login/data/models/register_success.dart';
import '../models/login_success.dart';

class AuthRepository {
  Future<LoginSuccess> login(
    String username,
    String password,
  ) async {
    try {
      final response = await postIt(
        '${AppConstant.baseUrl}login',
        null,
        {
          'username': username,
          'password': password,
        },
      );

      return LoginSuccess.fromJson(response.data);
    } catch (e) {
      // Handle errors
      rethrow;
    }
  }

  Future<RegisterSuccess> register(
      String email, String password, String username) async {
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

      return RegisterSuccess.fromJson(response.data);
    } catch (e) {
      // Handle errors
      rethrow;
    }
  }
}

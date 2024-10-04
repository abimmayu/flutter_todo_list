import 'package:todo_list/core/utils/secure_storage.dart';

class SecureHeaders {
  static Future<Map<String, String>> getHeaders() async {
    final token = await SecureStorage().readData(key: "token");
    return {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    };
  }
}

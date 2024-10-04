import 'package:todo_list/feature/login/domain/entities/token.dart';

class LoginSuccess {
  int statusCode;
  String message;
  String? errorMessage;
  Token data;

  LoginSuccess({
    required this.statusCode,
    required this.message,
    required this.errorMessage,
    required this.data,
  });

  factory LoginSuccess.fromJson(Map<String, dynamic> json) => LoginSuccess(
        statusCode: json["statusCode"],
        message: json["message"],
        errorMessage: json["errorMessage"],
        data: Token.fromJson(json["data"]),
      );
}

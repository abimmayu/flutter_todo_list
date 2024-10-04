class RegisterSuccess {
  int statusCode;
  String message;
  String errorMessage;
  String? data;

  RegisterSuccess({
    required this.statusCode,
    required this.message,
    required this.errorMessage,
    this.data,
  });

  factory RegisterSuccess.fromJson(Map<String, dynamic> json) =>
      RegisterSuccess(
        statusCode: json["statusCode"],
        message: json["message"],
        errorMessage: json["errorMessage"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "errorMessage": errorMessage,
        "data": data,
      };
}

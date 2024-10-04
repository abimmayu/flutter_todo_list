import 'package:todo_list/feature/checklist/domain/entities/checklist.dart';
import 'package:todo_list/feature/checklist/domain/entities/item.dart';

class NewChecklistSuccess {
  final int statusCode;
  final String message;
  String? errorMessage;
  final Checklist data;

  NewChecklistSuccess({
    required this.statusCode,
    required this.message,
    this.errorMessage,
    required this.data,
  });

  factory NewChecklistSuccess.fromJson(Map<String, dynamic> json) {
    return NewChecklistSuccess(
      statusCode: json['statusCode'],
      message: json['message'],
      errorMessage: json['errorMessage'],
      data: Checklist.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "errorMessage": errorMessage,
        "data": data.toJson(),
      };
}

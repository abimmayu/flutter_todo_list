import 'package:todo_list/feature/checklist/domain/entities/item.dart';

class AllItemOnChecklist {
  final int statusCode;
  final String message;
  String? errorMessage;
  final List<Item> data;

  AllItemOnChecklist({
    required this.statusCode,
    required this.message,
    this.errorMessage,
    required this.data,
  });

  factory AllItemOnChecklist.fromJson(Map<String, dynamic> json) {
    return AllItemOnChecklist(
      statusCode: json['statusCode'],
      message: json['message'],
      errorMessage: json['errorMessage'],
      data: List<Item>.from(json['data'].map((x) => Item.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "errorMessage": errorMessage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

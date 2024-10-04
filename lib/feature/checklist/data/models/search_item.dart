import 'package:todo_list/feature/checklist/domain/entities/item.dart';

class SearchItem {
  final int statusCode;
  final String message;
  String? errorMessage;
  final Item data;

  SearchItem({
    required this.statusCode,
    required this.message,
    this.errorMessage,
    required this.data,
  });

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(
      statusCode: json['statusCode'],
      message: json['message'],
      errorMessage: json['errorMessage'],
      data: Item.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "errorMessage": errorMessage,
        "data": data.toJson(),
      };
}

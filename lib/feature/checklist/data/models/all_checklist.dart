import 'package:todo_list/feature/checklist/domain/entities/checklist.dart';

class AllChecklist {
  final int statusCode;
  final String message;
  String? errorMessage;
  final List<Checklist> data;

  AllChecklist({
    required this.statusCode,
    required this.message,
    this.errorMessage,
    required this.data,
  });

  factory AllChecklist.fromJson(Map<String, dynamic> json) {
    return AllChecklist(
      statusCode: json['statusCode'],
      message: json['message'],
      errorMessage: json['errorMessage'],
      data:
          List<Checklist>.from(json['data'].map((x) => Checklist.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'message': message,
      'errorMessage': errorMessage,
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}

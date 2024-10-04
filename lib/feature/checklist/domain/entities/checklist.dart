import 'package:todo_list/feature/checklist/domain/entities/item.dart';

class Checklist {
  final int id;
  final String name;
  final List<Item> items;
  final bool checlistCompletionStatus;

  Checklist({
    required this.id,
    required this.name,
    required this.items,
    required this.checlistCompletionStatus,
  });

  factory Checklist.fromJson(Map<String, dynamic> json) {
    return Checklist(
      id: json['id'],
      name: json['name'],
      items: (json['items'] as List).map(
        (item) {
          return Item.fromJson(item);
        },
      ).toList(),
      checlistCompletionStatus: json['checklistCompletionStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'items': items.map((item) => item.toJson()).toList(),
      'checklistCompletionStatus': checlistCompletionStatus,
    };
  }
}

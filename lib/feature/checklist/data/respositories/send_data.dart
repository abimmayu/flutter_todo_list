import 'package:todo_list/core/service/dio.dart';
import 'package:todo_list/feature/checklist/data/models/new_checklist.dart';
import 'package:todo_list/feature/checklist/data/models/search_item.dart';

class SendDataRepository {
  Future<SearchItem> sendItem(int id, Map<String, dynamic> body) async {
    try {
      final response =
          await postIt('{AppConstant.baseUrl}checklist/$id/item', null, body);

      return SearchItem.fromJson(response.data);
    } catch (e) {
      // Handle errors
      rethrow;
    }
  }

  Future<NewChecklistSuccess> sendChecklist(Map<String, dynamic> body) async {
    try {
      final response = await postIt(
        '{AppConstant.baseUrl}checklist',
        null,
        body,
      );
      return NewChecklistSuccess.fromJson(response.data);
    } catch (e) {
      // Handle errors
      rethrow;
    }
  }

  Future<SearchItem> deleteItem(int checklistId, int itemId) async {
    try {
      final response = await deleteIt(
        '{AppConstant.baseUrl}checklist/$checklistId/item/$itemId',
        null,
        {},
      );
      return SearchItem.fromJson(response.data);
    } catch (e) {
      // Handle errors
      rethrow;
    }
  }

  Future<SearchItem> updateItem(
      int checklistId, int itemId, Map<String, dynamic> body) async {
    try {
      final response = await putIt(
        '{AppConstant.baseUrl}checklist/$checklistId/item/$itemId',
        null,
        body,
      );
      return SearchItem.fromJson(response.data);
    } catch (e) {
      // Handle errors
      rethrow;
    }
  }

  Future<SearchItem> renameItem(
      int checklistId, Map<String, dynamic> body, int itemId) async {
    try {
      final response = await putIt(
        '{AppConstant.baseUrl}checklist/$checklistId/item/rename/$itemId',
        null,
        body,
      );
      return SearchItem.fromJson(response.data);
    } catch (e) {
      // Handle errors
      rethrow;
    }
  }
}

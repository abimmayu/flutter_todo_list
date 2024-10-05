import 'package:todo_list/core/service/dio.dart';
import 'package:todo_list/feature/checklist/data/models/new_checklist.dart';
import 'package:todo_list/feature/checklist/data/models/search_item.dart';

class SendDataRepository {
  Future<NewChecklistSuccess> sendChecklist(
    String name,
  ) async {
    try {
      final response = await postIt(
        '{AppConstant.baseUrl}checklist',
        null,
        {
          "name": name,
        },
      );
      return NewChecklistSuccess.fromJson(response.data);
    } catch (e) {
      // Handle errors
      rethrow;
    }
  }

  Future<bool> deleteChecklist(int checklistId) async {
    try {
      final response = await deleteIt(
        '{AppConstant.baseUrl}checklist/$checklistId',
        null,
        {},
      );
      return response.data;
    } catch (e) {
      // Handle errors
      rethrow;
    }
  }

  Future<SearchItem> sendItem(
    int id,
    String itemName,
  ) async {
    try {
      final response = await postIt(
        '{AppConstant.baseUrl}checklist/$id/item',
        null,
        {
          "itemName": itemName,
        },
      );

      return SearchItem.fromJson(response.data);
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
    int checklistId,
    int itemId,
  ) async {
    try {
      final response = await putIt(
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

  Future<SearchItem> renameItem(
      int checklistId, String itemName, int itemId) async {
    try {
      final response = await putIt(
        '{AppConstant.baseUrl}checklist/$checklistId/item/rename/$itemId',
        null,
        {
          "itemName": itemName,
        },
      );
      return SearchItem.fromJson(response.data);
    } catch (e) {
      // Handle errors
      rethrow;
    }
  }
}

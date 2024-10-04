import 'package:todo_list/core/service/dio.dart';
import 'package:todo_list/feature/checklist/data/models/all_checklist.dart';
import 'package:todo_list/feature/checklist/data/models/all_item_on_checklist.dart';
import 'package:todo_list/feature/checklist/data/models/search_item.dart';

class RequestChecklistRepository {
  Future<AllChecklist> getAllChecklist() async {
    try {
      final response = await getIt(
        '{AppConstant.baseUrl}checklist',
        null,
      );

      return AllChecklist.fromJson(response.data);
    } catch (e) {
      // Handle errors
      rethrow;
    }
  }

  Future<AllItemOnChecklist> getAllItemOnChecklist(int checklistId) async {
    try {
      final response = await getIt(
        '{AppConstant.baseUrl}checklist/$checklistId/item',
        null,
      );

      return AllItemOnChecklist.fromJson(response.data);
    } catch (e) {
      // Handle errors
      rethrow;
    }
  }

  Future<SearchItem> searchItem(int checklistId, int itemId) async {
    try {
      final response = await getIt(
        '{AppConstant.baseUrl}checklist/$checklistId/item/$itemId',
        null,
      );

      return SearchItem.fromJson(response.data);
    } catch (e) {
      // Handle errors
      rethrow;
    }
  }
}

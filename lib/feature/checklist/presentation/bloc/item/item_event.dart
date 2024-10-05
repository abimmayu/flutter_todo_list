part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {}

class GetAllItem extends ItemEvent {
  final int checklistId;
  GetAllItem(this.checklistId);
  @override
  List<Object> get props => [checklistId];
}

class CreateItem extends ItemEvent {
  final int checklistId;
  final String itemName;
  CreateItem(this.checklistId, this.itemName);
  @override
  List<Object> get props => [checklistId, itemName];
}

class SearchItem extends ItemEvent {
  final int checklistId;
  final int itemId;
  SearchItem(this.checklistId, this.itemId);
  @override
  List<Object> get props => [checklistId, itemId];
}

class UpdateItem extends ItemEvent {
  final int checklistId;
  final int itemId;
  UpdateItem(this.checklistId, this.itemId);
  @override
  List<Object> get props => [checklistId, itemId];
}

class DeteleItem extends ItemEvent {
  final int checklistId;
  final int itemId;
  DeteleItem(this.checklistId, this.itemId);
  @override
  List<Object> get props => [checklistId, itemId];
}

class RenameItem extends ItemEvent {
  final int checklistId;
  final int itemId;
  final String itemName;
  RenameItem(this.checklistId, this.itemId, this.itemName);
  @override
  List<Object> get props => [checklistId, itemId, itemName];
}

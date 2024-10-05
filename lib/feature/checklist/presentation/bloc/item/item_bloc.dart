import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/feature/checklist/data/respositories/request_data.dart';
import 'package:todo_list/feature/checklist/data/respositories/send_data.dart';
import 'package:todo_list/feature/checklist/domain/entities/item.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final RequestChecklistRepository _requestData;
  final SendDataRepository _sendDataRepository;
  ItemBloc(
    this._requestData,
    this._sendDataRepository,
  ) : super(ItemInitial()) {
    on<GetAllItem>(_onGetAllItem);
    on<CreateItem>(_onCreateItem);
    on<SearchItem>(_onSearchItem);
    on<RenameItem>(_onRenameItem);
    on<DeteleItem>(_onDeteleItem);
  }

  Future<void> _onGetAllItem(
    GetAllItem event,
    Emitter<ItemState> emit,
  ) async {
    try {
      final result =
          await _requestData.getAllItemOnChecklist(event.checklistId);
      emit(
        AllItemLoaded(
          result.data,
        ),
      );
    } catch (e) {
      emit(
        ItemError(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _onCreateItem(
    CreateItem event,
    Emitter<ItemState> emit,
  ) async {
    try {
      final result = await _sendDataRepository.sendItem(
        event.checklistId,
        event.itemName,
      );
      emit(
        ItemLoaded(
          result.data,
        ),
      );
    } catch (e) {
      emit(
        ItemError(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _onSearchItem(
    SearchItem event,
    Emitter<ItemState> emit,
  ) async {
    try {
      final result = await _requestData.searchItem(
        event.checklistId,
        event.itemId,
      );
      emit(
        ItemLoaded(
          result.data,
        ),
      );
    } catch (e) {
      emit(
        ItemError(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _onRenameItem(
    RenameItem event,
    Emitter<ItemState> emit,
  ) async {
    try {
      final result = await _sendDataRepository.renameItem(
        event.checklistId,
        event.itemName,
        event.itemId,
      );
      emit(
        ItemLoaded(
          result.data,
        ),
      );
    } catch (e) {
      emit(
        ItemError(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _onDeteleItem(
    DeteleItem event,
    Emitter<ItemState> emit,
  ) async {
    try {
      final result = await _sendDataRepository.deleteItem(
        event.checklistId,
        event.itemId,
      );
      emit(
        ItemLoaded(
          result.data,
        ),
      );
    } catch (e) {
      emit(
        ItemError(
          e.toString(),
        ),
      );
    }
  }
}

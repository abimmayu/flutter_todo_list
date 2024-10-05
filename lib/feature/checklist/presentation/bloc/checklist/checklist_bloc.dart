import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/feature/checklist/data/respositories/request_data.dart';
import 'package:todo_list/feature/checklist/data/respositories/send_data.dart';
import 'package:todo_list/feature/checklist/domain/entities/checklist.dart';

part 'checklist_event.dart';
part 'checklist_state.dart';

class ChecklistBloc extends Bloc<ChecklistEvent, ChecklistState> {
  final RequestChecklistRepository checklistRepository;
  final SendDataRepository sendDataRepository;

  ChecklistBloc(
    this.checklistRepository,
    this.sendDataRepository,
  ) : super(ChecklistInitial()) {
    on<GetChecklist>(_onGetChecklist);
    on<AddChecklist>(_onAddChecklist);
    on<DeleteChecklist>(_deleteChecklist);
  }

  void _onGetChecklist(
    GetChecklist event,
    Emitter<ChecklistState> emit,
  ) async {
    try {
      emit(ChecklistLoading());
      final checklist = await checklistRepository.getAllChecklist();
      emit(
        ChecklistLoaded(
          checklist.data,
        ),
      );
    } catch (e) {
      emit(
        ChecklistError(
          e.toString(),
        ),
      );
    }
  }

  void _onAddChecklist(
    AddChecklist event,
    Emitter<ChecklistState> emit,
  ) async {
    try {
      emit(ChecklistLoading());
      final checklist = await sendDataRepository.sendChecklist(event.name);
      emit(
        ChecklistLoaded(
          [
            checklist.data,
          ],
        ),
      );
    } catch (e) {
      emit(ChecklistError(e.toString()));
    }
  }

  void _deleteChecklist(
    DeleteChecklist event,
    Emitter<ChecklistState> emit,
  ) async {
    try {
      emit(ChecklistLoading());
      final checklist = await sendDataRepository.deleteChecklist(event.id);
      if (checklist == true) {
        emit(
          ChecklistDeteleted(),
        );
      }
    } catch (e) {
      emit(ChecklistError(e.toString()));
    }
  }
}

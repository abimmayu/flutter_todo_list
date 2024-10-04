part of 'checklist_bloc.dart';

abstract class ChecklistEvent extends Equatable {}

class GetChecklist extends ChecklistEvent {
  final List<Checklist> data;
  GetChecklist(this.data);

  @override
  List<Object> get props => [data];
}

class AddChecklist extends ChecklistEvent {
  final Checklist checklist;
  AddChecklist(this.checklist);

  @override
  List<Object> get props => [checklist];
}

class DeleteChecklist extends ChecklistEvent {
  final String status;

  DeleteChecklist(this.status);

  @override
  List<Object> get props => [status];
}

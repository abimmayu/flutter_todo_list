part of 'checklist_bloc.dart';

abstract class ChecklistEvent extends Equatable {}

class GetChecklist extends ChecklistEvent {
  final List<Checklist> data;
  GetChecklist(this.data);

  @override
  List<Object> get props => [data];
}

class AddChecklist extends ChecklistEvent {
  final String name;
  AddChecklist(this.name);

  @override
  List<Object> get props => [name];
}

class DeleteChecklist extends ChecklistEvent {
  final int id;

  DeleteChecklist(this.id);

  @override
  List<Object> get props => [id];
}

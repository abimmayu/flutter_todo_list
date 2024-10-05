part of 'checklist_bloc.dart';

abstract class ChecklistState extends Equatable {
  @override
  List<Object> get props => [];
}

class ChecklistInitial extends ChecklistState {}

class ChecklistLoading extends ChecklistState {}

class ChecklistLoaded extends ChecklistState {
  final List<Checklist> data;

  ChecklistLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class ChecklistError extends ChecklistState {
  final String message;

  ChecklistError(this.message);

  @override
  List<Object> get props => [message];
}

class ChecklistDeteleted extends ChecklistState {}

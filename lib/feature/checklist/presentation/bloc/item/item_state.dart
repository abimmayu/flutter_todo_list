part of 'item_bloc.dart';

abstract class ItemState extends Equatable {
  @override
  List<Object> get props => [];
}

class ItemInitial extends ItemState {}

class AllItemLoaded extends ItemState {
  final List<Item> items;
  AllItemLoaded(this.items);

  @override
  List<Object> get props => [items];
}

class ItemLoaded extends ItemState {
  final Item item;
  ItemLoaded(this.item);

  @override
  List<Object> get props => [item];
}

class ItemError extends ItemState {
  final String message;
  ItemError(this.message);

  @override
  List<Object> get props => [message];
}

class ItemLoading extends ItemState {}

class ItemUpdated extends ItemState {
  final Item item;
  ItemUpdated(this.item);

  @override
  List<Object> get props => [item];
}

class ItemDeteled extends ItemState {}

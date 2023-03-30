part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object> get props => [];
}

class ItemFetchEvent extends ItemEvent {
  const ItemFetchEvent();

  @override
  List<Object> get props => [];
}

class AddCartItemEvent extends ItemEvent {
  final int currentItemId;

  const AddCartItemEvent({required this.currentItemId});

  @override
  List<Object> get props => [];
}

class RemoveCartItemEvent extends ItemEvent {
  final int currentItemId;

  const RemoveCartItemEvent({required this.currentItemId});

  @override
  List<Object> get props => [];
}

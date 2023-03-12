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

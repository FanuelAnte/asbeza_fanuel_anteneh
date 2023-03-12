part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class HistoryFetchEvent extends HistoryEvent {
  const HistoryFetchEvent();

  @override
  List<Object> get props => [];
}

class AddHistoryItemEvent extends HistoryEvent {
  Item currentItem;

  AddHistoryItemEvent({required this.currentItem});

  @override
  List<Object> get props => [];
}

class RemoveHistoryItemEvent extends HistoryEvent {
  Item currentItem;

  RemoveHistoryItemEvent({required this.currentItem});

  @override
  List<Object> get props => [];
}

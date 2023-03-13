part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistorySuccess extends HistoryState {
  final List historyItems;
  final Map itemsMap;

  HistorySuccess(this.historyItems, this.itemsMap);
}

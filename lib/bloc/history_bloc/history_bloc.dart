import 'package:asbeza/bloc/item_bloc/item_bloc.dart';
import 'package:asbeza/models/items.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  List historyItems = [];
  num price = 0;

  HistoryBloc() : super(HistoryInitial()) {
    on<HistoryFetchEvent>((event, emit) async {
      emit(HistoryLoading());
      emit(HistorySuccess(historyItems));
    });

    on<AddHistoryItemEvent>((event, emit) {
      emit(HistoryLoading());
      historyItems.add(event.currentItem);
      emit(HistorySuccess(historyItems));
    });

    on<RemoveHistoryItemEvent>((event, emit) {
      emit(HistoryLoading());
      historyItems.removeWhere((element) => element.id == event.currentItem.id);
      emit(HistorySuccess(historyItems));
    });
  }
}

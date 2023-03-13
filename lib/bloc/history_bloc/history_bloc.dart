import 'dart:ffi';

import 'package:asbeza/bloc/item_bloc/item_bloc.dart';
import 'package:asbeza/models/items.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  List historyItems = [];
  Map itemsMap = {};
  num price = 0;

  HistoryBloc() : super(HistoryInitial()) {
    on<HistoryFetchEvent>((event, emit) async {
      emit(HistoryLoading());
      emit(HistorySuccess(historyItems, itemsMap));
    });

    on<AddHistoryItemEvent>((event, emit) {
      emit(HistoryLoading());
      historyItems.add(event.currentItem);
      itemsMap[historyItems
              .firstWhere((element) => element.id == event.currentItem.id)] =
          historyItems
              .where((element) => element.id == event.currentItem.id)
              .length;
      emit(HistorySuccess(historyItems, itemsMap));
    });

    on<RemoveHistoryItemEvent>((event, emit) {
      emit(HistoryLoading());
      // historyItems.removeWhere((element) => element.id == event.currentItem.id);

      final int historyItemIndex = historyItems
          .indexWhere((element) => element.id == event.currentItem.id);
      print(historyItemIndex);
      historyItems.removeAt(historyItemIndex);

      // itemsMap[event.currentItem] = itemsMap[event.currentItem] - 1;

      // itemsMap[historyItems
      //     .firstWhere((element) => element.id == event.currentItem.id)] -= 1;

      itemsMap[historyItems
              .firstWhere((element) => element.id == event.currentItem.id)] =
          historyItems
              .where((element) => element.id == event.currentItem.id)
              .length;

      if (itemsMap[historyItems
              .firstWhere((element) => element.id == event.currentItem.id)] ==
          0) {
        itemsMap.remove(historyItems
            .firstWhere((element) => element.id == event.currentItem.id));
      }

      emit(HistorySuccess(historyItems, itemsMap));
    });
  }
}

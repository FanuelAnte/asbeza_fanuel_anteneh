import 'package:asbeza/services/apiService.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/items.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final _apiServiceProvider = ApiServiceProvider();

  ItemBloc() : super(ItemInitial()) {
    List<dynamic>? items;
    Map<int, int> cartItems = {};

    on<ItemFetchEvent>((event, emit) async {
      emit(ItemLoading());
      items = await _apiServiceProvider.fetchActivity();

      cartItems = {for (var element in items!) element.id: 0};

      emit(ItemSuccess(items: items!, cartItems: cartItems));
    });

    on<AddCartItemEvent>((event, emit) {
      emit(ItemInitial());

      for (var itemId in cartItems.keys) {
        if (itemId == event.currentItemId) {
          cartItems[itemId] = cartItems[itemId]! + 1;
        }
      }

      emit(ItemSuccess(items: items!, cartItems: cartItems));
    });

    on<RemoveCartItemEvent>((event, emit) {
      emit(ItemInitial());

      for (var itemId in cartItems.keys) {
        if (itemId == event.currentItemId && cartItems[itemId]! > 0) {
          cartItems[itemId] = cartItems[itemId]! - 1;
        }
      }

      emit(ItemSuccess(items: items!, cartItems: cartItems));
    });
  }
}

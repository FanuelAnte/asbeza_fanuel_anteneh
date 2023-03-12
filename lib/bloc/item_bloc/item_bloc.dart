import 'package:asbeza/services/apiService.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final _apiServiceProvider = ApiServiceProvider();
  // List items = [];

  ItemBloc() : super(ItemInitial()) {
    on<ItemFetchEvent>((event, emit) async {
      emit(ItemLoading());
      final fetched = await _apiServiceProvider.fetchActivity();
      emit(ItemSuccess(items: fetched!));
    });
  }
}

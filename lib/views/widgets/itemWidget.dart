import 'package:asbeza/models/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/history_bloc/history_bloc.dart';
import '../../bloc/item_bloc/item_bloc.dart';

class ItemWidget extends StatelessWidget {
  final int id;
  final String itemImage;
  final String itemName;
  final num itemPrice;
  final String page;

  const ItemWidget(
      {required this.id,
      required this.itemImage,
      required this.itemName,
      required this.itemPrice,
      super.key,
      required this.page});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        Item currentItem = Item(
          id: id,
          image: itemImage,
          price: itemPrice,
          title: itemName,
        );
        return Container(
          child: Row(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.network(itemImage),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(itemName, overflow: TextOverflow.ellipsis),
                    Text('$itemPrice'),
                    ActionButton(
                      currentItem: currentItem,
                      page: page,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ActionButton extends StatelessWidget {
  final Item currentItem;
  final String page;

  const ActionButton(
      {super.key, required this.currentItem, required this.page});

  @override
  Widget build(BuildContext context) {
    if (page == "home") {
      return ElevatedButton(
        onPressed: () => {
          BlocProvider.of<HistoryBloc>(context)
              .add(AddHistoryItemEvent(currentItem: currentItem)),
          BlocProvider.of<HistoryBloc>(context).price += currentItem.price,
          print(BlocProvider.of<HistoryBloc>(context).price)
        },
        child: Icon(Icons.add),
      );
    } else if (page == "history") {
      return ElevatedButton(
        onPressed: () => {
          BlocProvider.of<HistoryBloc>(context)
              .add(RemoveHistoryItemEvent(currentItem: currentItem)),
          BlocProvider.of<HistoryBloc>(context).price -= currentItem.price,
          print(BlocProvider.of<HistoryBloc>(context).historyItems)
        },
        child: Icon(Icons.remove),
      );
    } else {
      return Container();
    }
  }
}

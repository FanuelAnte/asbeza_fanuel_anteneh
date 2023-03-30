import 'package:asbeza/models/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<ItemBloc, ItemState>(
      builder: (context, state) {
        Item currentItem = Item(
          id: id,
          image: itemImage,
          price: itemPrice,
          title: itemName,
        );
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            color: Colors.blueGrey[100],
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
                      SizedBox(
                        height: 25,
                        child: ActionButton(
                          currentItem: currentItem,
                          page: page,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
      return IconButton(
        onPressed: () => {
          BlocProvider.of<ItemBloc>(context)
              .add(AddCartItemEvent(currentItemId: currentItem.id)),
        },
        icon: const Icon(Icons.add),
      );
    } else if (page == "history") {
      return IconButton(
        onPressed: () => {
          BlocProvider.of<ItemBloc>(context)
              .add(RemoveCartItemEvent(currentItemId: currentItem.id)),
          // BlocProvider.of<HistoryBloc>(context).price += currentItem.price,
        },
        icon: const Icon(Icons.remove),
      );
    } else {
      return Container();
    }
  }
}

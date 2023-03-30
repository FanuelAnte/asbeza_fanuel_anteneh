import 'package:asbeza/bloc/item_bloc/item_bloc.dart';
import 'package:asbeza/views/widgets/itemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/items.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemBloc, ItemState>(
      builder: (context, state) {
        if (state is ItemInitial) {
          BlocProvider.of<ItemBloc>(context).add(const ItemFetchEvent());
        }
        if (state is ItemLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is ItemSuccess) {
          print(state.cartItems);
          return Column(
            children: [
              Expanded(
                child: ItemsBuilder(
                    itemsList: parseCartMap(state.items, state.cartItems)),
              ),
            ],
          );
        } else {
          return Text("error");
        }
      },
    );
  }
}

List<dynamic> parseCartMap(List<dynamic> items, Map<int, int> cartItems) {
  List<dynamic> cartList = [];

  for (var element in items) {
    if (cartItems[element.id]! > 0) {
      cartList.add(element);
    }
  }

  return cartList;
}

class ItemsBuilder extends StatelessWidget {
  final List itemsList;

  const ItemsBuilder({super.key, required this.itemsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: itemsList.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            id: itemsList[index].id,
            itemImage: itemsList[index].image,
            itemName: itemsList[index].title,
            itemPrice: itemsList[index].price,
            page: "history",
          );
        });
  }
}

import 'package:asbeza/bloc/item_bloc/item_bloc.dart';
import 'package:asbeza/views/widgets/itemWidget.dart';
import 'package:flutter/material.dart';
import 'package:asbeza/services/apiService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          return Container(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ItemsBuilder(itemsList: state.items),
            ),
          );
        } else {
          return Text("error");
        }
      },
    );
  }
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
            page: "home",
          );
        });
  }
}

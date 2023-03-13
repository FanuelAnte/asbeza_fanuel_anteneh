import 'package:asbeza/bloc/history_bloc/history_bloc.dart';
import 'package:asbeza/views/widgets/itemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state is HistoryInitial) {
          return Center(
            child: ElevatedButton(
              onPressed: () => BlocProvider.of<HistoryBloc>(context)
                  .add(const HistoryFetchEvent()),
              child: Text("Get"),
            ),
          );
          // BlocProvider.of<ItemBloc>(context).add(const ItemFetchEvent());
        }
        if (state is HistoryLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is HistorySuccess) {
          return Column(
            children: [
              Center(
                  child: Text(
                      '${BlocProvider.of<HistoryBloc>(context).itemsMap}')),
              Center(
                  child: Text(
                      '${BlocProvider.of<HistoryBloc>(context).price.round()}')),
              Expanded(
                // width: MediaQuery.of(context).size.width,
                // child: Text('${state.items}'),
                child: ItemsBuilder(itemsList: state.itemsMap.keys.toList()),
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

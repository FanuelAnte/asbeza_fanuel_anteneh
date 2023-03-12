import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final int id;
  final String itemImage;
  final String itemName;
  final num itemPrice;

  const ItemWidget(
      {required this.id,
      required this.itemImage,
      required this.itemName,
      required this.itemPrice,
      super.key});

  @override
  Widget build(BuildContext context) {
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
                ElevatedButton(
                  onPressed: () => {},
                  child: Icon(Icons.add),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

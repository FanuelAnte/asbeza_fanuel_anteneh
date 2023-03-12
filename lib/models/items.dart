import 'dart:convert';

class Item {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;

  Item({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
        id: parsedJson['id'],
        title: parsedJson['title'],
        price: parsedJson['price'],
        description: parsedJson['description'],
        category: parsedJson['category'],
        image: parsedJson['image']);
  }
}

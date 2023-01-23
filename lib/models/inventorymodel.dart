import 'package:flutter/cupertino.dart';

class Inventory {
  late final int? id;
  final String? name;
  final int? price;
  final ValueNotifier<int>? quantity;
  final String? image;

  Inventory(
      {required this.id,
        required this.name,
        required this.price,
        required this.quantity,
        required this.image});

  Inventory.fromMap(Map<dynamic, dynamic> data)
      : id = data['id'],
        name = data['name'],
        price = data['price'],
        quantity = ValueNotifier(data['quantity']),
        image = data['image'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity?.value,
      'image': image,
    };
  }

  Map<String, dynamic> quantityMap() {
    return {
      'quantity': quantity!.value,
    };
  }
}
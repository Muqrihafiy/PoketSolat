class LivingRoomItem {
  late final String name;
  late final int price;
  late final String image;

  LivingRoomItem({required this.name, required this.price, required this.image});

  Map toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
    };
  }
  // List<LivingRoomItem> products = [
  //   LivingRoomItem(
  //       name: 'Apple',
  //       price: 20,
  //       image: 'assets/images/apple.png'),
  //
  //   LivingRoomItem(
  //       name: 'Mango',
  //       price: 30,
  //       image: 'assets/images/mango.png'),
  //
  // ];
}
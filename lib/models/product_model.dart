class Product {
  final String name;
  final double price;
  final String image;

  const Product({
    required this.name,
    required this.price,
    required this.image,
  });

  static const List<Product> products = [
    Product(
      name: 'Чучвара',
      price: 12,
      image: 'assets/png/food_picture.png',
    ),
    Product(
      name: 'Плов',
      price: 15,
      image: 'assets/png/food_picture.png',
    ),
    Product(
      name: 'Мастава',
      price: 12,
      image: 'assets/png/food_picture.png',
    ),
  ];
}

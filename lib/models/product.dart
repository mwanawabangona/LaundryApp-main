class Product {
  String name;
  double price;
  int qty;

  Product({
    required this.name,
    required this.price,
    this.qty = 1,
  });
}

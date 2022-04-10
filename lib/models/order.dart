class Order {
  final int id;
  final double totalPrice;

  Order({required this.id, required this.totalPrice});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        id: int.parse(json['id']),
        totalPrice: double.parse(json['total_price']));
  }
}
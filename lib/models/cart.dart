import 'package:project_cartridje_mobile/models/product.dart';

class Cart {
  final int id;
  final Product product;
  final int numOfItem;

  Cart({required this.id, required this.product, required this.numOfItem});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(id: int.parse(json['id']), product: Product.fromJson(json['product']), numOfItem: json['quantity']);
  }
}

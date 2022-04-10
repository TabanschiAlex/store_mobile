import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_cartridje_mobile/api/api.dart';
import 'package:project_cartridje_mobile/helper/local_storage.dart';
import 'package:project_cartridje_mobile/models/cart.dart';
import 'package:project_cartridje_mobile/models/order.dart';

class OrderApi {
  static const resource = 'orders';

  Future<List<Order>> get() async {
    final List<Order> orders = [];

    var response = await http.get(
      Uri.parse(host + resource),
      headers: <String, String>{
        'Authorization': 'Bearer ' + Storage.get('token')
      },
    );

    final body = jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw Exception(body['message']);
    }

    for (int i = 0; i < body.length; i++) {
      orders.add(Order.fromJson(body[i]));
    }

    return orders;
  }

  Future<bool> create(List<Cart> inCart) async {
    List<Map<String, dynamic>> order = [];

    for (int i = 0; i < inCart.length; i++) {
      order.add({
        'product_id': inCart[i].product.id.toString(),
        'quantity': inCart[i].numOfItem.toString()
      });
    }

    var response = await http.post(Uri.parse(host + resource),
        headers: <String, String>{
          'Authorization': 'Bearer ' + Storage.get('token'),
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'items': order}));

    if (response.statusCode != 201) {
      throw Exception(response.body);
    }

    return true;
  }
}

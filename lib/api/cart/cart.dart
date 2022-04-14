import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_cartridje_mobile/api/api.dart';
import 'package:project_cartridje_mobile/helper/local_storage.dart';
import 'package:project_cartridje_mobile/models/cart.dart';

class CartApi {
  static const resource = 'cart';

  Future<List<Cart>> get() async {
    var response = await http.get(
      Uri.parse(host + resource),
      headers: <String, String>{
        'Authorization': 'Bearer ' + Storage.get('token'),
      },
    );

    final body = jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw Exception(body['message']);
    }

    final List<Cart> items = [];

    for (int i = 0; i < body.length; i++) {
      items.add(Cart.fromJson(body[i]));
    }

    return items;
  }

  getTotalPrice() async {
    var response = await http.get(
      Uri.parse(host + resource),
      headers: <String, String>{
        'Authorization': 'Bearer ' + Storage.get('token'),
      },
    );

    final body = jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw Exception(body['message']);
    }

    return body;
  }

  Future<bool> add(int id, int quantity) async {
    var response = await http.post(
        Uri.parse(host + resource),
        headers: <String, String>{
          'Authorization': 'Bearer ' + Storage.get('token'),
        },
        body: {
          'product_id': id.toString(),
          'quantity': quantity.toString()
        }
    );

    if (response.statusCode != 201) {
      throw Exception('Error');
    }

    return true;
  }

  Future<void> updateQuantity() async {

  }

  Future<bool> deleteItem(int id) async {
    var response = await http.delete(
      Uri.parse(host + resource),
      headers: <String, String>{
        'Authorization': 'Bearer ' + Storage.get('token'),
      },
      body: {
        'id': id.toString()
      }
    );

    if (response.statusCode != 200) {
      throw Exception('Delete error');
    }

    return true;
  }
}

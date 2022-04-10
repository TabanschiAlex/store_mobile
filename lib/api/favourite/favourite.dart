import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_cartridje_mobile/api/api.dart';
import 'package:project_cartridje_mobile/helper/local_storage.dart';
import 'package:project_cartridje_mobile/models/product.dart';

class FavouriteApi {
  static const resource = 'favourites';

  Future<List<Product>> get() async {
    final List<Product> products = [];

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
      products.add(Product.fromJson(body[i]));
    }

    return products;
  }

  Future<bool> add(int productId) async {
    var response = await http.post(
      Uri.parse(host + resource),
      headers: <String, String>{
        'Authorization': 'Bearer ' + Storage.get('token'),
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{'product_id': productId}),
    );

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    return true;
  }

  Future<bool> remove(int id) async {
    var response = await http.delete(
      Uri.parse(host + 'auth/login'),
      headers: <String, String>{
        'Authorization': 'Bearer ' + Storage.get('token'),
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'id': id.toString()}),
    );

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    return true;
  }
}

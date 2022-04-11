import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_cartridje_mobile/api/api.dart';
import 'package:project_cartridje_mobile/helper/local_storage.dart';
import 'package:project_cartridje_mobile/models/product.dart';

class ProductApi {
  static const resource = 'products';

  Future<List<Product>> get() async {
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

    final List<Product> products = [];

    for (int i = 0; i < body.length; i++) {
      products.add(Product.fromJson(body[i]));
    }

    return products;
  }
}
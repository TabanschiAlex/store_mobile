import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_cartridje_mobile/api/api.dart';
import 'package:project_cartridje_mobile/helper/local_storage.dart';

class FavouriteApi {
  static const resource = 'favourites';

  Future<void> get() async {
    var response = await http.get(Uri.parse(host + resource));

    print(response.body);
  }

  Future<void> add(int productId) async {
    var response = await http.post(
      Uri.parse(host + resource),
      headers: <String, String>{
        'Authorization': 'Bearer ' + Storage.get('token'),
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{'product_id': productId}),
    );

    print(response.body);
  }

  Future<void> remove(int id) async {
    var response = await http.delete(
      Uri.parse(host + 'auth/login'),
      headers: <String, String>{
        'Authorization': 'Bearer ' + Storage.get('token'),
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'id': id.toString()}),
    );

    print(response.body);
  }
}

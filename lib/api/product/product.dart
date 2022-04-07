import 'package:http/http.dart' as http;
import 'package:project_cartridje_mobile/api/api.dart';

class ProductApi {
  static const resource = 'products/';

  Future<void> get() async {
    var response = await http.get(Uri.parse(host + resource));

    print(response.body);
  }
}
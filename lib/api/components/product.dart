import 'package:project_cartridje_mobile/api/http.dart';

class Product {
  Future getProducts() {
    return Http.get('http://192.168.100.3/api/cities');
  }
}
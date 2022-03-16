import 'package:http/http.dart' as http;

class Http {
  static Future<http.Response> get(String url) {
    return http.get(Uri.parse(url));
  }

  static Future<http.Response> post(String url) {
    return http.post(Uri.parse(url));
  }

  static Future<http.Response> put(String url) {
    return http.put(Uri.parse(url));
  }

  static Future<http.Response> path(String url) {
    return http.patch(Uri.parse(url));
  }

  static Future<http.Response> delete(String url) {
    return http.delete(Uri.parse(url));
  }
}
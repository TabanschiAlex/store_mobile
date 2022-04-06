import 'dart:convert';

import 'package:project_cartridje_mobile/models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const host = 'http://localhost/api/';

  Future<void> login() async {
    var a = http.post(
      Uri.parse(host + 'auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': 'pro100ckris@yandex.ru',
        'password': '123456'
      }),
    );

    print(a);


  }
}
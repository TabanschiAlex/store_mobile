import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/user.dart';
import '../api.dart';

class AuthApi {
  Future<User> login(String email, String password) async {
    var response = await http.post(
      Uri.parse(host + 'auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );

    final body = jsonDecode(response.body);

    if (response.statusCode != 201) {
      throw Exception(body['message']);
    }

    return User.fromJson(body);
  }

  Future<User> register(String email, String password, String repeated) async {
    final response = await http.post(
      Uri.parse(host + 'auth/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'passwordConfirmation': repeated
      }),
    );

    final body = jsonDecode(response.body);

    if (response.statusCode != 201) {
      throw Exception(body['message']);
    }

    return User.fromJson(body);
  }

  Future<bool> forgot(String email) async {
    final response = await http.post(
      Uri.parse(host + 'auth/forgot'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );


    if (response.statusCode != 201) {
      throw Exception('User does not exist!');
    }

    return true;
  }

}

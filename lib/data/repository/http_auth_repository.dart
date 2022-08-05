import 'dart:convert';

import 'package:picktock/data/models/failure.dart';
import 'package:picktock/styles/style.dart';
import 'package:picktock/data/models/user.dart';
import 'package:picktock/domain/repository/abstract_auth.dart';
import 'package:http/http.dart' as http;

class HttpAuthRepository extends AbstractAuth {
  late Failure _failure;
  @override
  Future<User> login(String email, String password) async {
    try {
      String url = baseUri + "/api/auth/login";

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          "Accept": "application/json",
          // 'Authorization': "Bearer $token",
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);
        jsonData = jsonData['data'];
        User user = User.fromJson(jsonData);
        return user;
      } else {
        _failure = Failure("jsonDecode(response.body)", response.statusCode);
        print(_failure);
        throw _failure;
      }
      // } else if (response.statusCode == 422) {
      //   print("Error en las Validaciones");
      //   return User.nullable();
      // } else if (response.statusCode == 401) {
      //   print("Error de credenciales");
      //   return User.nullable();
      // }
    } on Failure catch (e) {
      _failure = Failure("Final", 0);
      rethrow;
    }
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<bool> register(User user, String password) async {
    String url = baseUri + "/api/auth/signup";
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        "Accept": "application/json",
      },
      body: jsonEncode({
        "name": user.name,
        "lastname": user.lastname,
        "email": user.email,
        "password": password,
        "user_nivel_tea": user.userNivelTea
      }),
    );
    dynamic jsonData = jsonDecode(response.body);
    if (response.statusCode == 201) {
      jsonData = jsonData['message'];
      return true;
    } else if (response.statusCode == 422) {
      _failure = Failure(jsonData["errors"]["email"][0], response.statusCode);
      print("""
      $jsonData
      Failure: ${_failure.message}
      """);
      throw _failure;
    } else {
      _failure = Failure("Error no encontrado", response.statusCode);
      throw _failure;
    }
  }
}

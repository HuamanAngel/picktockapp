import 'dart:convert';

import 'package:picktock/styles/style.dart';
import 'package:picktock/data/models/user.dart';
import 'package:picktock/domain/repository/abstract_auth.dart';
import 'package:http/http.dart' as http;

class HttpAuthRepository extends AbstractAuth {
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
      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);
        jsonData = jsonData['data'];
        User user = User.fromJson(jsonData);
        print("En caso de exito enviar a una rutae");
        return user;
      } else if (response.statusCode == 422) {
        print("Validaciones");
        return User.nullable();
      } else {
        print("Error no encontrado");
        return User.nullable();
      }
    } catch (e) {
      throw Exception(e);
    }

    throw UnimplementedError();
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<bool> register(User user, String password) async {
    try {
      String url = baseUri + "/api/auth/signup";
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          "Accept": "application/json",
          // 'Authorization': "Bearer $token",
        },
        body: jsonEncode({
          "name": user.name,
          "lastname": user.lastname,
          "email": user.email,
          "password": password,
          "user_nivel_tea": user.userNivelTea
        }),
      );
      print(user.email);
      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);
        jsonData = jsonData['message'];
        print(jsonData);
        return true;
      } else if (response.statusCode == 422) {
        dynamic jsonData = jsonDecode(response.body);
        print(jsonData);
        print("Error en Validaciones");
        return false;
      } else {
        dynamic jsonData = jsonDecode(response.body);
        print(jsonData);
        print("Error no encontrado");
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
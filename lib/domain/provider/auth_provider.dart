import 'package:flutter/material.dart';
import 'package:picktock/data/models/user.dart';
import 'package:picktock/data/repository/http_auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  // Estado actual
  late User _user;

  User get user => _user;

  set user(User user) {
    _user = user;
    // Avisa widget que estan escuchando
    notifyListeners();
  }

  static Future<User> login(String email, String password) async {
    HttpAuthRepository httpAuthRepository = HttpAuthRepository();
    User user = await httpAuthRepository.login(email, password);
    return user;
  }

  static Future<bool> register(User user, String password) async {
    HttpAuthRepository httpAuthRepository = HttpAuthRepository();
    bool isOkay = await httpAuthRepository.register(user, password);
    return isOkay;
  }
}

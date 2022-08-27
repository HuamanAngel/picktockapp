import 'package:flutter/material.dart';
import 'package:picktock/data/models/user.dart';
import 'package:picktock/data/repository/http_auth_repository.dart';
import 'package:picktock/domain/repository/abstract_auth.dart';

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
    AbstractAuth repository = HttpAuthRepository();
    User user = await repository.login(email, password);
    return user;
  }

  static Future<bool> register(User user, String password) async {
    AbstractAuth repository = HttpAuthRepository();
    bool isOkay = await repository.register(user, password);
    return isOkay;
  }
}

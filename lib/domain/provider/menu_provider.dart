import 'package:flutter/material.dart';

enum AuthPageState {
  login,
  register,
  loguedIn,
}
class MenuProvider extends ChangeNotifier {  
  // Estado actual
  String _menu = "Inicio";
  Color colorPressed = Colors.yellow;
  bool isMenuOpen = true;
  AuthPageState _authPageState = AuthPageState.login;

  AuthPageState get authPageState => _authPageState;

  set authPageState(AuthPageState value) {
    _authPageState = value;
    notifyListeners();
  }

  String get menu => _menu;
  set menu(String value) {  
    _menu = value;
    // Avisa widget que estan escuchando
    notifyListeners();
  }

  void switchOpen() {
    isMenuOpen = !isMenuOpen;
    notifyListeners();
  }
}

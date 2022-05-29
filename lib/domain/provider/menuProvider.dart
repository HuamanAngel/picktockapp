import 'package:flutter/material.dart';


class MenuProvider extends ChangeNotifier {
  // Estado actual
  String _menu = "Inicio";
  
  String get menu => _menu;
  set menu(String value) {
    _menu = value;
    // Avisa widget que estan escuchando
    notifyListeners();
  }
}




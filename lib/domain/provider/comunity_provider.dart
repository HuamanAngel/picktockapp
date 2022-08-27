import 'package:flutter/material.dart';

class ComunityProvider extends ChangeNotifier{
  String _menu = "dash";
  String get menu => _menu;
  set menu(String value) {
    _menu = value;
    notifyListeners();
  }
}
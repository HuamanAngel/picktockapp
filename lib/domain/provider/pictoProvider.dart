import 'package:flutter/material.dart';
import 'package:picktock/data/models/newpicto.dart';
import 'package:picktock/data/repository/http_picto_repository.dart';

class AuthProvider extends ChangeNotifier {
  // Estado actual
  late NewPicto _newPicto;

  NewPicto get user => _newPicto;
  set user(NewPicto newPicto) {
    _newPicto = newPicto;
    // Avisa widget que estan escuchando
    notifyListeners();
  }

  static Future<bool> register(NewPicto newPicto) async {
    HttpPictoRepository httpPictoRepository = HttpPictoRepository();
    bool isOkay = await httpPictoRepository.addpicto(newPicto);
    return isOkay;
  }
}

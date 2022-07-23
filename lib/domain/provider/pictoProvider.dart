import 'package:flutter/material.dart';
import 'package:picktock/data/models/newpicto.dart';
import 'package:picktock/data/models/pictograma.dart';
import 'package:picktock/data/repository/http_picto_repository.dart';

class PictoProvider extends ChangeNotifier {
  // Estado actual
  late NewPicto _newPicto;

  NewPicto get newPicto => _newPicto;
  set newPicto(NewPicto newPicto) {
    _newPicto = newPicto;
    // Avisa widget que estan escuchando
    notifyListeners();
  }

  static Future<bool> register(NewPicto newPicto) async {
    // HttpPictoRepository httpPictoRepository = HttpPictoRepository();
    // bool isOkay = await httpPictoRepository.addpicto(newPicto);
    // return isOkay;
    return true;
  }

  static Future<List<Picto>> getPictos() async {
    HttpPictoRepository httpPictoRepository = HttpPictoRepository();
    List<Picto> pictos = await httpPictoRepository.getPictos();
    return pictos;
  }
}

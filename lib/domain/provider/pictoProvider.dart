import 'package:flutter/material.dart';
import 'package:picktock/data/models/newpicto.dart';
import 'package:picktock/data/models/pictograma.dart';
import 'package:picktock/data/repository/http_picto_repository.dart';

class PictoProvider extends ChangeNotifier {
  // Estado actual
  late Picto _newPicto;

  Picto get newPicto => _newPicto;
  set newPicto(Picto newPicto) {
    _newPicto = newPicto;
    // Avisa widget que estan escuchando
    notifyListeners();
  }

  static Future<bool> addpicto(String titulo, String visibilidad,
      dynamic imagen, String categoria) async {
    HttpPictoRepository httpPictoRepository = HttpPictoRepository();
    bool isOkay = await httpPictoRepository.addpicto(
        titulo, visibilidad, imagen, categoria);
    return isOkay;
    //return true;
  }

  static Future<List<Picto>> getPictos() async {
    HttpPictoRepository httpPictoRepository = HttpPictoRepository();
    List<Picto> pictos = await httpPictoRepository.getPictos();
    return pictos;
  }
}

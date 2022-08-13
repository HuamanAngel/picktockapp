import 'package:flutter/material.dart';
import 'package:picktock/data/models/categorie.dart';
import 'package:picktock/data/repository/http_cat_repository.dart';

class CategorieProvider extends ChangeNotifier {
  // Estado actual
  late Categorie _categorie;

  Categorie get categorie => _categorie;
  set categorie(Categorie categorie) {
    _categorie = categorie;
    // Avisa widget que estan escuchando
    notifyListeners();
  }

  static Future<bool> register(Categorie categorie) async {
    HttpCatRepository httpCategorieRepository = HttpCatRepository();
    bool isOkay = await httpCategorieRepository.addCategorie(categorie);
    return isOkay;
  }

  static Future<List<Categorie>> listar() async {
    HttpCatRepository httpCategorieRepository = HttpCatRepository();
    List<Categorie> categorie = await httpCategorieRepository.listar();
    return categorie;
  }
}

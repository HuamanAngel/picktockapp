import 'package:picktock/data/models/categorie.dart';

abstract class AbstractCat {
  Future<bool> addCategorie(Categorie user);
  Future<Categorie> listar();
}

import 'package:picktock/data/models/newpicto.dart';
import 'package:picktock/data/models/pictograma.dart';

abstract class AbstractPicto {
  Future<bool> addpicto(
      String titulo, String visibilidad, dynamic imagen, String categoria);
  Future<List<Picto>> getPictos();
}

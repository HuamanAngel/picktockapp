import 'package:picktock/data/models/newpicto.dart';
import 'package:picktock/data/models/pictograma.dart';

abstract class AbstractPicto {
  Future<bool> addpicto(Picto picto);
  Future<List<Picto>> getPictos();
}

import 'package:picktock/data/models/newpicto.dart';

abstract class AbstractPicto {
  Future<bool> mostrarPicto(NewPicto user);
}

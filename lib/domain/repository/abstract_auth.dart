import 'package:picktock/data/models/user.dart';

abstract class AbstractAuth {
  Future<User> login(String email, String password);
  Future<bool> register(User user,String password);
  Future<bool> logout();
}
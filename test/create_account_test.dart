import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:picktock/data/models/failure.dart';
import 'package:picktock/data/repository/http_auth_repository.dart';

void main() {
  testWidgets('Register with email already used', (WidgetTester tester) async {

    HttpAuthRepository repository = HttpAuthRepository();
    dynamic response;
    try {
      response = repository.login("edsonsalvador2014@gmail.com", "contraseña");
      print(response);
    } on Failure catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }

    // Verify that our counter starts at 0.
    // expect(42, 42);
  });
}

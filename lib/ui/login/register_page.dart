import 'package:flutter/material.dart';
import 'package:picktock/ui/extensions/content_wrapper.dart';
import 'package:picktock/ui/login/register_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageUsuario();
}
class _RegisterPageUsuario extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return [
      const Padding(
        padding: EdgeInsets.only(bottom: 3, top: 10),
        child: Text(
          "Crear nueva cuenta",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 25,
            fontFamily: 'Arial',
          ),
        ),
      ),
      const Divider(
        indent: 20,
        endIndent: 20,
        color: Colors.white,
        thickness: 2.0,
      ),
      const RegisterForm(),
    ].wrapContainer();
  }
}

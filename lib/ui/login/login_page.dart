import 'package:flutter/material.dart';
import 'package:picktock/ui/extensions/content_wrapper.dart';
import 'package:picktock/ui/login/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return [
      const Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const Divider(
        color: Colors.white,
        thickness: 1.5,
        indent: 20,
        endIndent: 20,
      ),
      const LoginForm(),
      const Divider(
        color: Colors.black,
        thickness: 1,
      ),
    ].wrapContainer(context);
  }
}
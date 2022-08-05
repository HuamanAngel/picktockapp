import 'package:flutter/material.dart';
import 'package:picktock/ui/login/create_account_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageUsuario();
}

class _RegisterPageUsuario extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width - 260,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 193, 7),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(150),
                  blurRadius: 5,
                  offset: const Offset(10, 10),
                )
              ],
            ),
            child: Column(
              children: [
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
                CreateAccountForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
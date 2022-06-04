import "package:flutter/material.dart";
import "package:provider/provider.dart";

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const GenerateAppTitle = "Login de acceso !!!";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: GenerateAppTitle,
    );
  }
}

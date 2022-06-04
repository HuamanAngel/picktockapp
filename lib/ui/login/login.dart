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
        home: Material(
          child: Row(children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: LoginScreen(),
              ),
              flex: 4,
            )
          ]),
        ));
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Title(
              title: "Iniciar Sesión",
              color: Colors.yellow,
              child: Text(
                "Iniciar Sesión",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            _emailInput(),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: _passwordInput()),
            Padding(
                padding: const EdgeInsets.only(top: 20), child: _loginButton()),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: _googleButton()),
          ]),
    ));
  }

  Widget _emailInput() {
    return TextFormField(
        decoration: InputDecoration(
      labelText: "Email",
      labelStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ));
  }

  Widget _passwordInput() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Contraseña",
        labelStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      obscureText: true,
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
        child: Text("Iniciar Sesión"),
        onPressed: () {
          null;
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 12),
            textStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)));
  }

  Widget _googleButton() {
    return ElevatedButton(
        child: Text("Iniciar Sesión con Google"),
        onPressed: () {
          null;
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 12),
            textStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)));
  }
}

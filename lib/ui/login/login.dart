import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:picktock/data/models/user.dart';
import 'package:picktock/domain/provider/auth_provider.dart';
import 'package:picktock/domain/provider/menuProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*$");

bool _esEmail(String str) {
  return _emailRegExp.hasMatch(str.toLowerCase());
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  bool _isLoading = false;
  setLoading(bool state) => setState(() => _isLoading = state);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final menuProvider = Provider.of<MenuProvider>(context);
    final storage = FlutterSecureStorage();
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 193, 7),
        borderRadius: BorderRadius.circular(50),
      ),
      margin: const EdgeInsets.all(50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Form(
              key: _formKey,
              child: Container(
                margin:
                    EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(20)), // set rounded corner radius
                ),
                child: Column(children: <Widget>[
                  _emailField(),
                  _passwordField(),
                ]),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.all(15),
                child: _isLoading
                    ? CircularProgressIndicator()
                    : FlatButton.icon(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setLoading(true);
                            User user = await AuthProvider.login(
                                controllerEmail.text, controllerPassword.text);
                            print(user.id);
                            // print(user.);
                            if (user.id != -1) {
                              authProvider.user = user;
                              // Redirige a la pantalla principal
                              setLoading(false);
                              menuProvider.menu = "Inicio";
                              Scaffold.of(context).showSnackBar(const SnackBar(
                                content: Text('Logeado correctamente'),
                                backgroundColor: Colors.green,
                              ));
                            } else {
                              setLoading(false);
                              Scaffold.of(context).showSnackBar(const SnackBar(
                                content: Text('Credenciales no validas'),
                                backgroundColor: Colors.red,
                              ));
                            }
                          }
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Iniciar Sesión",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            // Container(
            //   padding: EdgeInsets.all(20),
            //   child: Text(
            //     "¿No tienes una cuenta?",
            //     style: TextStyle(
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // Container(
            //     width: 200,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: <Widget>[
            //         FloatingActionButton(
            //           child: Icon(FontAwesomeIcons.google),
            //           onPressed: null,
            //         ),
            //         FloatingActionButton(
            //             backgroundColor: Color(0xff3b5998),
            //             child: Icon(FontAwesomeIcons.facebook),
            //             onPressed: null),
            //         FloatingActionButton(
            //             backgroundColor: Color(0xff00aced),
            //             child: Icon(FontAwesomeIcons.twitter),
            //             onPressed: null)
            //       ],
            //     ))
          ],
        ),
      ),
    );
  }

  Widget _emailField() {
    return Container(
      margin: EdgeInsets.only(top: 12, bottom: 12, left: 40, right: 40),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
          controller: controllerEmail,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Por favor ingrese un email';
            } else if (!_esEmail(value)) {
              return 'Por favor ingrese un email valido';
            }
          },
          decoration: InputDecoration(
            hintText: "Correo Electrónico",
            suffixIcon: Icon(
              Icons.person,
              size: 35,
            ),
            hintStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  Widget _passwordField() {
    return Container(
      margin: EdgeInsets.only(top: 12, bottom: 12, left: 40, right: 40),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Contraseña",
          suffixIcon: Icon(
            Icons.lock,
            size: 35,
          ),
          hintStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        obscureText: true,
        controller: controllerPassword,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor ingrese una contraseña';
          } else if (value.length < 5) {
            return 'Por favor ingrese una contraseña con mas caracteres';
          }
        },
      ),
    );
  }
}

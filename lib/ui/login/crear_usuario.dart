import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:picktock/data/models/user.dart';
import 'package:picktock/domain/provider/auth_provider.dart';

class Registro extends StatefulWidget {
  @override
  State<Registro> createState() => _RegistroUsuario();
}

final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*$");

bool _esEmail(String str) {
  return _emailRegExp.hasMatch(str.toLowerCase());
}

class _RegistroUsuario extends State<Registro> {
  final _formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerLastname = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 193, 7),
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withAlpha(150),
              blurRadius: 5,
              offset: Offset(10, 10))
        ],
      ),
      margin: EdgeInsets.only(top: 24, left: 100, right: 100, bottom: 24),
      child: Column(children: [
        Padding(
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
        Divider(
          color: Colors.white,
          thickness: 2.5,
        ),
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                  margin:
                      EdgeInsets.only(top: 3, left: 40, right: 40, bottom: 3),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(15)), // set rounded corner radius
                  ),
                  child: Column(
                    children: [
                      CampotextoUser(controllerName),
                      CampotextoLastname(controllerLastname),
                      CampotextoEmail(controllerEmail),
                      CampotextoPassword(controllerPassword),
                    ],
                  ),
                ),
              ),
              Container(
                //margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: EdgeInsets.all(3),
                child: FlatButton(
                    child: Text(
                      "Registrarse",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        User user = User(
                            name: controllerName.text,
                            lastname: controllerLastname.text,
                            email: controllerEmail.text,
                            createdAt: '',
                            id: 1,
                            userNivelTea: 1);

                        await AuthProvider.register(
                            user, controllerPassword.text);
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Creando usuario")));
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Usuario creado"),
                          backgroundColor: Colors.green,
                        ));
                      }
                    }),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

Widget CampotextoUser(TextEditingController controller) {
  return Container(
    margin: EdgeInsets.only(top: 3, left: 40, right: 40, bottom: 3),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.white,
      // set rounded corner radius
    ),
    child: TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ingrese el nombre de usuario';
        }
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Nombre de usuario',
        suffixIcon: Icon(Icons.person),
        hintStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget CampotextoLastname(TextEditingController controller) {
  return Container(
    margin: EdgeInsets.only(top: 3, left: 40, right: 40, bottom: 3),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.white,
      // set rounded corner radius
    ),
    child: TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ingrese el nombre de usuario';
        }
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Apellidos',
        suffixIcon: Icon(Icons.person),
        hintStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget CampotextoEmail(TextEditingController controller) {
  return Container(
    margin: EdgeInsets.only(top: 3, left: 40, right: 40, bottom: 3),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.white,
      // set rounded corner radius
    ),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: 'Email',
        suffixIcon: Icon(Icons.mail),
        hintStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      controller: controller,
      validator: (value) {
        if (!_esEmail(value.toString())) {
          return 'Ingrese un email correcto';
        }
      },
    ),
  );
}

Widget CampotextoPassword(TextEditingController controller) {
  return Container(
    margin: EdgeInsets.only(top: 3, left: 40, right: 40, bottom: 3),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.white,
      // set rounded corner radius
    ),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: 'Contraseña',
        suffixIcon: Icon(Icons.lock),
        hintStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      controller: controller,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ingrese una contraseña';
        }
      },
    ),
  );
}

Widget CampotextoPasswordRepeat(TextEditingController controller) {
  return Container(
    margin: EdgeInsets.only(top: 3, left: 40, right: 40, bottom: 3),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.white,
      // set rounded corner radius
    ),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: 'Confirmar contraseña',
        border: InputBorder.none,
        suffixIcon: Icon(Icons.lock),
        hintStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      obscureText: true,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ingrese una contraseña';
        }
      },
    ),
  );
}

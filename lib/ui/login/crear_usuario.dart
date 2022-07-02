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
          color: Colors.blue.shade200, borderRadius: BorderRadius.circular(35)),
      margin: EdgeInsets.only(top: 50, left: 100, right: 100, bottom: 50),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(bottom: 15, top: 15),
          child: Text(
            "Crear nueva cuenta",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Arial',
            ),
          ),
        ),
        Divider(
          color: Colors.black,
          thickness: 2.5,
        ),
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              CampotextoUser(controllerName),
              CampotextoLastname(controllerLastname),
              CampotextoEmail(controllerEmail),
              CampotextoPassword(controllerPassword),
              Container(
                //margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: EdgeInsets.all(5),
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
    margin: EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius:
          BorderRadius.all(Radius.circular(20)), // set rounded corner radius
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
        border: InputBorder.none,
        suffixIcon: Icon(Icons.person),
      ),
    ),
  );
}

Widget CampotextoLastname(TextEditingController controller) {
  return Container(
    margin: EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius:
          BorderRadius.all(Radius.circular(20)), // set rounded corner radius
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
        border: InputBorder.none,
        suffixIcon: Icon(Icons.person),
      ),
    ),
  );
}

Widget CampotextoEmail(TextEditingController controller) {
  return Container(
    margin: EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius:
          BorderRadius.all(Radius.circular(20)), // set rounded corner radius
    ),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: 'Email',
        border: InputBorder.none,
        suffixIcon: Icon(Icons.mail),
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
    margin: EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius:
          BorderRadius.all(Radius.circular(20)), // set rounded corner radius
    ),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: 'Contraseña',
        border: InputBorder.none,
        suffixIcon: Icon(Icons.lock),
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
    margin: EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius:
          BorderRadius.all(Radius.circular(20)), // set rounded corner radius
    ),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: 'Confirmar contraseña',
        border: InputBorder.none,
        suffixIcon: Icon(Icons.lock),
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

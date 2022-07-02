import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 193, 7).withAlpha(255),
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withAlpha(150),
              blurRadius: 5,
              offset: Offset(10, 10))
        ],
      ),
      margin: EdgeInsets.only(top: 50, left: 100, right: 100, bottom: 50),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(bottom: 15, top: 15),
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
              CampotextoUser(),
              CampotextoEmail(),
              CampotextoPassword(),
              CampotextoPasswordRepeat(),
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Accesando al Sistema")));
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

Widget CampotextoUser() {
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
      decoration: InputDecoration(
        hintText: 'Nombre de usuario',
        border: InputBorder.none,
        suffixIcon: Icon(Icons.person),
      ),
    ),
  );
}

Widget CampotextoEmail() {
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
      validator: (value) {
        if (!_esEmail(value.toString())) {
          return 'Ingrese un email correcto';
        }
      },
    ),
  );
}

Widget CampotextoPassword() {
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
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ingrese una contraseña';
        }
      },
    ),
  );
}

Widget CampotextoPasswordRepeat() {
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
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ingrese una contraseña';
        }
      },
    ),
  );
}

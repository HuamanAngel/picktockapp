import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Registro extends StatelessWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {}),
        ),
        Divider(color: Colors.black),
        Padding(
          padding: EdgeInsets.only(bottom: 5, top: 5),
          child: Text(
            "O continuar con",
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Arial',
            ),
          ),
        ),
        Container(
          //margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: EdgeInsets.all(5),

          child: FlatButton(
              child: Text(
                "Google",
                style: TextStyle(
                    color: Colors.black, fontSize: 20, fontFamily: 'Roboto'),
              ),
              onPressed: () {}),
        )
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
    child: TextField(
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
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Email',
        border: InputBorder.none,
        suffixIcon: Icon(Icons.mail),
      ),
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
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Contraseña',
        border: InputBorder.none,
        suffixIcon: Icon(Icons.lock),
      ),
      obscureText: true,
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
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Confirmar contraseña',
        border: InputBorder.none,
        suffixIcon: Icon(Icons.lock),
      ),
      obscureText: true,
    ),
  );
}

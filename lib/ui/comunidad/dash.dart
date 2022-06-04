import 'package:flutter/material.dart';

class Comunidad extends StatefulWidget {
  Comunidad({Key? key}) : super(key: key);
  @override
  State<Comunidad> createState() => _ComunidadState();
}

class _ComunidadState extends State<Comunidad> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 10),
            child: Text(
              "Seleccione una opcion",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "Recuerda que para contribuir  con el contenido necesitas \n una seria de requisitos (revisar ¿Puedo contribuir?)",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ),
          _buildMenuItem(text: "¿Puedo Contribuir?", onPressed: () {}),
          _buildMenuItem(text: "Pictogramas pendientes", onPressed: () {}),
          _buildMenuItem(text: "!! Donación ¡¡", onPressed: () {}),
        ],
      ),
    );
  }
}

Widget _buildMenuItem(
    {required String text,
    required Function onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
    // padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Text(
            text,
            style: TextStyle(fontSize: 20 ,color: Colors.black),
          ),
        ),
      ),
    ),
  );
}

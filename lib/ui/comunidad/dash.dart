import 'package:flutter/material.dart';
import 'package:picktock/domain/provider/menuProvider.dart';
import 'package:provider/provider.dart';
import 'package:picktock/styles/style.dart';
import 'package:picktock/ui/widgets/title.dart';
import 'package:picktock/ui/enviarsugerencias/enviarSugerencias.dart';

class Comunidad extends StatefulWidget {
  Comunidad({Key? key}) : super(key: key);
  @override
  State<Comunidad> createState() => _ComunidadState();
}

class _ComunidadState extends State<Comunidad> {
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return Container(
      padding: styleContainer1['padding'],
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 10),
            child: titleFirst(textTitle: "Seleccione una opcion"),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "Recuerda que para contribuir  con el contenido necesitas \n una seria de requisitos (revisar ¿Puedo contribuir?)",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ),
          _buildMenuItem(
              text: "¿Puedo Contribuir?",
              route: "Comunidad/Contribuir",
              MenuProvider: menuProvider,context: context),
          _buildMenuItem(
              text: "Pictogramas pendientes",
              route: "Comunidad/Pendiente",
              MenuProvider: menuProvider,context: context),
          _buildMenuItem(
              text: "Enviar sugerencias",
              route: "enviarsugerencias/enviarSugerencias",
              MenuProvider: menuProvider,context: context),
          _buildMenuItem(
              text: "!! Donación ¡¡",
              route: "Comunidad/Donacion",
              MenuProvider: menuProvider,context: context),
        ],
      ),
    );
  }
}

Widget _buildMenuItem(
    {required String text, required String route, required MenuProvider,required context}) {
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
      onPressed: () {
        MenuProvider.menu = route;
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    ),
  );
}

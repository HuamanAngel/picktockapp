import "package:flutter/material.dart";
import 'package:picktock/ui/extensions/content_wrapper.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);
  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return [
      const Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          "Acerca de nosotros",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const Divider(
        color: Colors.black,
        thickness: 1,
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(50),
        margin: const EdgeInsets.all(30),
        child: const Text(
          "PickTock es un proyecto diseñado por estudiantes de la carrera de Ingeniería de Software de la Universidad Nacional Mayor de San Marcos, fue creado sin fines de lucro y tiene como objetivo poder servir como soporte para el tratamiento de niños con TEA (Trastorno de Espectro Autista), brindando seguridad y confianza en nuestros usuarios. \nSi se desea realizar un aporte económico voluntario se puede seguir el siguiente link: \n                                             buymeacoffee.com/PickTock",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
      const Divider(
        color: Colors.black,
        thickness: 1,
      ),
      const Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          "Contáctanos: picktockteam@gmail.com",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ].wrapContainer();
  }
}

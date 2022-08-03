import "package:flutter/material.dart";

class AboutUs extends StatefulWidget {
  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 193, 7),
        borderRadius: BorderRadius.circular(50),
      ),
      margin:
      const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Acerca de nosotros",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 1,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(50),
            margin: EdgeInsets.all(30),
            child: Text(
              "PickTock es un proyecto diseñado por estudiantes de la carrera de Ingeniería de Software de la Universidad Nacional Mayor de San Marcos, fue creado sin fines de lucro y tiene como objetivo poder servir como soporte para el tratamiento de niños con TEA (Trastorno de Espectro Autista), brindando seguridad y confianza en nuestros usuarios. \nSi se desea realizar un aporte económico voluntario se puede seguir el siguiente link: \n                                             buymeacoffee.com/PickTock",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 1,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text("Contáctanos: picktockteam@gmail.com",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ]),
      ),
    );
  }
}

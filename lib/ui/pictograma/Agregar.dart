import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:picktock/domain/provider/menuProvider.dart';
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class Agregar extends StatefulWidget {
  Agregar({Key? key}) : super(key: key);
  @override
  State<Agregar> createState() => _AgregarState();
}
class _AgregarState extends State<Agregar> {
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return Scaffold(
        backgroundColor: Colors.orange.shade100,

        body: Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                color: Colors.blue.shade200,
              )]
          ),

          margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Titulo",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    labelText: 'Ingresa un titulo'
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(

                  "Categoria",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              new DropdownButton<String>(
                items: <String>['Actividades', 'Emociones', 'Animales', 'Objetos'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},

              ),


              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Modo",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),

              new DropdownButton<String>(

                items: <String>['Publico', 'Privado'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},

              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Imagen",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    labelText: 'Sube tu imagen'
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.lightGreenAccent,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        spreadRadius: 2.0,
                        offset: Offset(5.0,5.0)
                    )
                  ],
                ),
                child:_buildMenuItem(
                    text:  "AÑADIR",
                    route: "AñadirPictograma",
                    MenuProvider: menuProvider,context: context),

              )
            ],
          ),
        )
    );



  }
}


Widget _buildMenuItem(
    {required String text, required String route, required MenuProvider,required context}) {
  return FlatButton(
      onPressed: () {
        MenuProvider.menu = route;
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );

}
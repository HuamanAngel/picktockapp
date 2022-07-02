import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sugerencia extends StatefulWidget {
  @override
  State<Sugerencia> createState() => _EnviarSugerencia();
}


class _EnviarSugerencia extends State<Sugerencia> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 193, 7), borderRadius: BorderRadius.circular(35)),
      margin: EdgeInsets.only(top: 50, left: 100, right: 100, bottom: 50),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(bottom: 15, top: 15),
          child: Text(
            "Enviar Sugerencia",
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
              CampotextoSug(),
              Container(
                //margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: EdgeInsets.all(5),
                child: FlatButton(
                    child: Text(
                      "Enviar Sugerencia",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Sugerencia enviada")));
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

Widget CampotextoSug() {
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
          return 'Ingrese la sugerencia';
        }
      },
      decoration: InputDecoration(
        hintText: 'Sugerencia',
        border: InputBorder.none,
        suffixIcon: Icon(Icons.mail),
      ),
    ),
  );
}

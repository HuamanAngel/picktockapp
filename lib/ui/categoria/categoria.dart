import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCategoria extends StatefulWidget {
  State<AddCategoria> createState() => _AddCategoriaState();
}

class _AddCategoriaState extends State<AddCategoria> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.blue.shade200,
            borderRadius: BorderRadius.circular(50)),
        margin:
            const EdgeInsets.only(bottom: 200, left: 300, right: 300, top: 80),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Agregar Categoría",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Form(
              key: _formKey,
              child: Column(children: <Widget>[
                Padding(padding: EdgeInsets.all(10)),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Título",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                _tituloField(),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Imagen",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      FlatButton.icon(
                          onPressed: () async {
                            null;
                          },
                          label: Text("Tomar foto",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          )),
                    ],
                  ),
                )
              ]),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.green.shade800,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(15),
              child: Column(children: [
                FlatButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Agregar",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ]),
            )
          ],
        ));
  }

  Widget _tituloField() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Titulo",
          hintStyle: TextStyle(fontSize: 20),
          suffixIcon: Icon(Icons.title),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Ingrese un titulo';
          }
          return null;
        },
      ),
    );
  }
}
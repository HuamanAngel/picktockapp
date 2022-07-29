import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
            color: Color.fromARGB(255, 255, 193, 7),
            borderRadius: BorderRadius.circular(50)),
        margin: const EdgeInsets.only(bottom: 30, left: 20, right: 30, top: 30),
        child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Agregar Categoría",
                    style: TextStyle(
                      fontSize: 20,
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
                    Padding(padding: EdgeInsets.all(5)),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Título",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
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
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
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
                                  TextStyle(fontSize: 15, color: Colors.white)),
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
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(5),
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
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    )
                  ]),
                )
              ],
            )));
  }

  Widget _tituloField() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Titulo",
          hintStyle: TextStyle(fontSize: 15),
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
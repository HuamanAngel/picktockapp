import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

class AddCategoria extends StatefulWidget {
  const AddCategoria({Key? key}) : super(key: key);

  @override
  State<AddCategoria> createState() => _AddCategoriaState();
}

class _AddCategoriaState extends State<AddCategoria> {
  final _formKey = GlobalKey<FormState>();
  final controllerNombre = TextEditingController();
  final controllerImage = TextEditingController();
  //late String _ruta;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 193, 7),
            borderRadius: BorderRadius.circular(50)),
        margin: const EdgeInsets.only(bottom: 30, left: 20, right: 30, top: 30),
        child: SingleChildScrollView(
            child: Column(children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Agregar Categoría",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
            thickness: 1,
          ),
          Form(
            key: _formKey,
            child: Column(children: <Widget>[
              const Padding(padding: EdgeInsets.all(5)),
              const Align(
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
              const Align(
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
                child: Column(
                  children: [
                    /*(_ruta == null)
                        ? Text("No hay imagen")
                        : Image.network(_ruta),
                    */
                    FlatButton(
                        child: Text("Subir Imagenn"),
                        onPressed: () async {
                          final ImagePicker _picker = ImagePicker();
                          final pickedFile = await _picker.getImage(
                              source: ImageSource.gallery, imageQuality: 50);
                        }),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  borderRadius: BorderRadius.circular(10),
                ),
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
            ]),
          )
        ])));
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

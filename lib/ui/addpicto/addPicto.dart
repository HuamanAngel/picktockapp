import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picktock/ui/addpicto/subirImagen.dart';

ImagePicker picker = ImagePicker();

class AddPictograma extends StatefulWidget {
  @override
  State<AddPictograma> createState() => _AddPictograma();

}


class _AddPictograma extends State<AddPictograma> {
  final _formKey = GlobalKey<FormState>();


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
            "Añadir un pictograma",
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
              CampotextoTitulo(),
              CampotextoCategoria(),
              CampotextoModo(),
              Imagen(),



              Container(
                //margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.green.shade800,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: EdgeInsets.all(5),
                child: FlatButton(
                    child: Text(
                      "Añadir",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Accesando al Sistema")));
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

Widget CampotextoTitulo() {
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
          return 'Ingrese el titulo del pictograma';
        }
      },
      decoration: InputDecoration(
        hintText: 'Titulo de pictograma',
        border: InputBorder.none,
        suffixIcon: Icon(Icons.text_fields),
      ),
    ),
  );
}

Widget CampotextoCategoria() {
  return Container(
    margin: EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
    padding: EdgeInsets.all(5),

    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius:
      BorderRadius.all(Radius.circular(20)), // set rounded corner radius
    ),

    child: DropdownButtonFormField(
      icon: const Icon(Icons.category),
      elevation: 16,
      onChanged: (String? newValue) {
        // setState(() {
        //   dropdownValue = newValue!;
        // });
      },
      hint: Text("Categoria"),
      items: <String>['Actividades', 'Animales', 'Emociones']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
  );
}

Widget CampotextoModo() {
  return Container(
    margin: EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius:
      BorderRadius.all(Radius.circular(20)), // set rounded corner radius
    ),
    child: DropdownButtonFormField(
      icon: const Icon(Icons.privacy_tip_outlined),
      elevation: 16,
      onChanged: (String? newValue) {
        // setState(() {
        //   dropdownValue = newValue!;
        // });
      },
      hint: Text("Modo"),
      items: <String>['Privado', 'Publico']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
  );
}

Widget CampoImagen() {
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
          return 'Selecciona una imagen';
        }
      },
      decoration: InputDecoration(
        hintText: 'Selecciona una imagen',
        border: InputBorder.none,
        suffixIcon: Icon(Icons.image_rounded),
      ),
    ),
  );
}

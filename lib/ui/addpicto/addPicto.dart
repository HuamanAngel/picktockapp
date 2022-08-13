import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:picktock/data/models/newpicto.dart';
import 'package:picktock/data/models/pictograma.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picktock/ui/addpicto/subirImagen.dart';
import 'package:picktock/domain/provider/pictoProvider.dart';

ImagePicker picker = ImagePicker();

class AddPictograma extends StatefulWidget {
  @override
  State<AddPictograma> createState() => _AddPictograma();
}

class _AddPictograma extends State<AddPictograma> {
  final _formKey = GlobalKey<FormState>();
  final controllerTitle = TextEditingController();
  final controllerCat = TextEditingController();
  final controllerVisibility = TextEditingController();
  final controllerImagen = TextEditingController();
  dynamic imagen64;
  dynamic imagenpath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.shade200, borderRadius: BorderRadius.circular(35)),
      margin: EdgeInsets.only(top: 50, left: 100, right: 100, bottom: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
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
                  CampotextoTitulo(controllerTitle),
                  CampotextoCategoria(controllerCat),
                  CampotextoModo(controllerVisibility),
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            Picto newPicto = Picto(
                              titulo: controllerTitle.text,
                              picVisibility: modeC,
                              imagenURL: controllerImagen.text,
                              catId: modeCat,
                              id: 1,
                              creacion: DateTime.now().toString(),
                            );

                            await PictoProvider.addpicto(controllerTitle.text,
                                getimage(), modeC, modeCat);
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text("Creando pictograma")));
                          }
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CampotextoTitulo(TextEditingController controller) {
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
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Titulo de pictograma',
          border: InputBorder.none,
          suffixIcon: Icon(Icons.text_fields),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> get CategoryItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Actividades"), value: "1"),
      const DropdownMenuItem(child: Text("Animales"), value: "2"),
      const DropdownMenuItem(child: Text("Emociones"), value: "3"),
    ];
    return menuItems;
  }

  String modeCat = "1";

  Widget CampotextoCategoria(TextEditingController controller) {
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
        value: modeCat,
        onChanged: (String? newValue) {
          setState(() {
            modeCat = newValue!;
          });
        },
        hint: Text("Categoria"),
        items: CategoryItems,
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Publico"), value: "1"),
      const DropdownMenuItem(child: Text("Privado"), value: "2"),
    ];
    return menuItems;
  }

  String modeC = "2";

  Widget CampotextoModo(TextEditingController controller) {
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
        value: modeC,
        onChanged: (String? newValue) {
          setState(() {
            modeC = newValue!;
          });
        },
        hint: Text("Modo"),
        items: dropdownItems,
      ),
    );
  }
}

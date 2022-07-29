import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:picktock/domain/utilities/reproducir.dart';
import 'package:picktock/ui/pictograma/cambiarvoz.dart';
import 'package:picktock/ui/widgets/w_pictograma.dart';
import 'package:picktock/data/models/pictograma.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:picktock/domain/provider/pictoProvider.dart';

class Pictograma extends StatefulWidget {
  const Pictograma({Key? key})
      : super(key: key);
  @override
  State<Pictograma> createState() => _PictogramaState();
}

class _PictogramaState extends State<Pictograma> {
  final controllerSearch = TextEditingController();
  bool dataDescargada = false;
  List<Picto> pictos = [];
  Future<SharedPreferences> preferencias = SharedPreferences.getInstance();
  String? token;

  @override
  initState() {
    super.initState();
    token = " ";
    _getPictos();
  }
  Future<List<Picto>> _getPictos() async {
    pictos = await PictoProvider.getPictos();
    setState(() => dataDescargada = true);
    return pictos;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              ordenar(icon: Icons.sort,text: "Alfabeto"),
              ordenar(icon: Icons.sort,text: "Recientes"),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    border: Border.all(color: Colors.black26),
                  ),
                  child: TextField(
                    controller: controllerSearch,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          controllerSearch.clear();
                        },
                      ),
                      fillColor: Colors.red,
                      border: const OutlineInputBorder(),
                      labelText: "Nombre del pictograma",
                    ),
                  ),
                ),
                flex: 6,
              ),
            ],
          ),
          Row(
              children: [
                Spacer(),
                Container(
                    margin: EdgeInsets.only( left: 50),
                    child: FlatButton(
                        child: Text(
                          "Combinar Pictograma",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        color: Colors.green,
                        onPressed: () {}
                    )
                )
              ]
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              height: double.infinity,
              width: double.infinity,
              color: Colors.transparent, //color azul
              child: dataDescargada
                  ? GridView.builder(
                  itemCount: pictos.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    return WidgetPictogr(
                      id: pictos[index].id,
                      nombre: pictos[index].titulo,
                      rutaImagen: pictos[index].imagenURL,
                      idPictograma: pictos[index].id,
                      creacion: pictos[index].creacion,
                    );
                  })
                  : const Center(
                child: CircularProgressIndicator(),
              ),
            ),


          ),


          Row(
              children: [
                Spacer(),
                Voz(),
              ]
          ),
        ],
      ),
    );
  }
}

Widget ordenar({required IconData icon, required String text}) {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10),
    child: ElevatedButton(
        onPressed: () {
          print(text);
        },
        child: Row(
          children: [Icon(icon), Text(text)],
        )),
  );
}

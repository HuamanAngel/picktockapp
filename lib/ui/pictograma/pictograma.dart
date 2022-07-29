import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:picktock/domain/utilities/reproducir.dart';
import 'package:provider/provider.dart';
import 'package:picktock/ui/pictograma/cambiarvoz.dart';
import 'package:picktock/ui/pictograma/picto.dart';
import 'package:picktock/data/models/pictograma.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Pictograma extends StatefulWidget {
  const Pictograma({Key? key}) : super(key: key);
  @override
  State<Pictograma> createState() => _PictogramaState();
}

class _PictogramaState extends State<Pictograma> {
  final controllerSearch = TextEditingController();
  late Future<List<Picto>> _listadoPictos;
  bool dataDescargada = false;
  List<Picto> pictos = [];
  Future<SharedPreferences> preferencias = SharedPreferences.getInstance();
  String? token;
  bool _isLoading = true;
  setLoading(bool state) => setState(() => _isLoading = state);

  Future<List<Picto>> _getPictos() async {
    final SharedPreferences pref2 = await preferencias;
    setState(() {
      token = (pref2.getString("token") ?? 's');
    });
    bool auth = (pref2.getBool("auth") ?? false);
    String url = " ";
    if (auth) {
      url =
          "http://picktock.alwaysdata.net/picktock-backend/public/api/auth/pictograma";
    } else {
      url =
          "http://picktock.alwaysdata.net/picktock-backend/public/api/pictograma/public";
    }

    try {
      final respuesta = await http.get(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          "Accept": "application/json",
          'Authorization': "Bearer $token",
        },
      );
      Map valor = jsonDecode(respuesta.body);
      setState(() {});

      setLoading(false);
      if (respuesta.statusCode == 200) {
      } else if (respuesta.statusCode == 422) {
        setState(() {});
      } else if (respuesta.statusCode == 401) {
        setState(() {});
      } else {
        setState(() {});
      }
      dynamic jsonData = ""; // as List;

      int tam = jsonData.length;
      for (var i = 0; i < tam; i++) {
        pictos.add(Picto(
          imagenURL: jsonData[i]["pic_url_image"],
          titulo: jsonData[i]["pic_title"],
          id: jsonData[i]["id"],
          creacion: jsonData[i]["created_at"],
        ));
      }
      setState(() => dataDescargada = true);
      return pictos;
    } catch (error) {
      throw Exception("Falló");
    }
  }

  @override
  initState() {
    super.initState();
    token = " ";
    _listadoPictos = _getPictos();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      child: SingleChildScrollView(
        child: Column(children: [
          Row(children: [
            ordenar(icon: Icons.sort, text: "Alfabeto"),
            ordenar(icon: Icons.sort, text: "Recientes"),
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
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        controllerSearch.clear();
                      },
                    ),
                    fillColor: Colors.red,
                    border: OutlineInputBorder(),
                    labelText: "Nombre del pictograma",
                  ),
                ),
              ),
              flex: 6,
            ),
          ]),
        ]),
      ),
    );
    Row(children: [
      Spacer(),
      Container(
          margin: EdgeInsets.only(left: 50),
          child: FlatButton(
              child: Text(
                "Combinar Pictograma",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              color: Colors.green,
              onPressed: () {}))
    ]);

    Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        color: Colors.transparent, //color azul
        child: dataDescargada
            ? GridView.builder(
                itemCount: pictos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return Pictogr(
                    id: index,
                    nombre: pictos[index].titulo,
                    rutaImagen: pictos[index].imagenURL,
                    idPictograma: pictos[index].idPictograma,
                    creacion: pictos[index].creacion,
                  );
                })
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );

    Row(children: [
      Spacer(),
      Voz(),
    ]);
    /* Row(
              child: Container(
                child: paginacion(),
              ),
          ),
*/
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

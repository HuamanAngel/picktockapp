import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:picktock/data/repository/repository_pictograma.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Pictogr extends StatefulWidget {
  final int id;
  final String rutaImagen;
  final String nombre;
  final String creacion;


  int? idPictograma;
  // int idPic;

  Pictogr({
    Key? key,
    required this.id,
    required this.nombre,
    required this.rutaImagen,
    required this.creacion,
    this.idPictograma,
  }) : super(key: key);

  @override
  State<Pictogr> createState() => _PictogrState();
}

class _PictogrState extends State<Pictogr> {
  Future<SharedPreferences> preferencias = SharedPreferences.getInstance();

  bool authEdit = false;
  String? token;
  Future<dynamic> obtenerAuth() async {
    final SharedPreferences pref2 = await preferencias;
    setState(() {
      authEdit = (pref2.getBool("auth") ?? false);
    });
  }

  bool isSelected = false;
  bool isButtonActive = true;



  @override
  initState() {
    obtenerAuth();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Card(
              elevation: 4,
              color: isSelected ? Colors.grey[400] : Colors.white,
              shape: RoundedRectangleBorder(
                // side: const BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Stack(
                        children: [
                          Image.network(
                            widget.rutaImagen,
                            width:
                            MediaQuery.of(context).size.width / 5 * 4 / 3 -
                                10,
                            height: MediaQuery.of(context).size.height / 4,
                            fit: BoxFit.scaleDown,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                      indent: 4,
                      endIndent: 4,
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        widget.nombre,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  // Widget conAuth(){
  //   return Column(
  //           children: <Widget>[
  //             Container(
  //               alignment: Alignment.topRight,
  //               child: IconButton(
  //                 tooltip: 'Editar',
  //                 padding: EdgeInsets.all(0),
  //                   onPressed: () {
  //                     Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                     builder: (context) => ViewSeguridad(
  //                       widgetNavegacion: EditPic(
  //                         nombre: widget.nombre,
  //                         rutaImagen: widget.rutaImagen,
  //                         id: widget.id,
  //                         idPictograma: widget.idPictograma,
  //                       ),
  //                     ),
  //                     ),
  //                     );
  //                   },
  //                   icon: Icon(Icons.settings_sharp)),
  //             ),
  //             Image.network(
  //               widget.rutaImagen,
  //               width: MediaQuery.of(context).size.width / 5 * 4 / 3 - 10,
  //               height: MediaQuery.of(context).size.height / 4,
  //             ),
  //             Container(
  //               padding: regularPadding,
  //               child: Text(widget.nombre),
  //             ),
  //           ],
  //   );
  // }

  // Widget sinAuth(){
  //   return Column(
  //           children: <Widget>[
  //             Image.network(
  //               widget.rutaImagen,
  //               width: MediaQuery.of(context).size.width / 5 * 4 / 3 - 10,
  //               height: MediaQuery.of(context).size.height / 4,
  //             ),
  //             Container(
  //               padding: regularPadding,
  //               child: Text(widget.nombre),
  //             ),
  //           ],
  //   );
  // }




}

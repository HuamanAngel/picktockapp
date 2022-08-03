import 'package:flutter/material.dart';
import 'package:picktock/domain/utilities/reproducir.dart';

class WidgetPictogr extends StatefulWidget {
  final int id;
  final String rutaImagen;
  final String nombre;
  final String creacion;

  int? idPictograma;
  // int idPic;

  WidgetPictogr({
    Key? key,
    required this.id,
    required this.nombre,
    required this.rutaImagen,
    required this.creacion,
    this.idPictograma,
  }) : super(key: key);

  @override
  State<WidgetPictogr> createState() => _PictogrState();
}

class _PictogrState extends State<WidgetPictogr> {
  bool authEdit = false;
  String? token;
  bool isSelected = false;
  bool isButtonActive = true;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {ReproduceSound.speak(widget.nombre)},
      child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Text(widget.nombre,
                      style: TextStyle(fontSize: 20),
                      overflow: TextOverflow.ellipsis)),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Image.network(
                  widget.rutaImagen,
                  width: MediaQuery.of(context).size.width / 5 * 4 / 3 - 10,
                  height: MediaQuery.of(context).size.height / 4,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          )),
    );
  }
}
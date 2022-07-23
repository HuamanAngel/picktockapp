import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
ImagePicker picker = ImagePicker();

class Imagen extends StatefulWidget {
  @override
  State<Imagen> createState() => _ImagenState();

}

class _ImagenState extends State<Imagen> {
  final imagen = File('image');
  final picker = ImagePicker();
  Future selImagen(op) async{
    var pickedFile;
    if (op==1){
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }
    setState((){
      if(pickedFile!= null){
        final imagen = File(pickedFile.path);
      }else{
        print('No seleccionaste ninguna foto');
      }
    });
    List bytes = await new File(pickedFile.path).readAsBytesSync();


  }
  opciones(context) {
    showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [

                  InkWell(
                    onTap:(){
                      selImagen(1);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                          children: [
                            Expanded(
                              child:Text('Seleccionar una foto',
                                  style: TextStyle(
                                    fontSize:16,
                                  )
                              ),
                            ),
                            Icon(Icons.image, color: Colors.blue),

                          ]
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:(){

                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration:BoxDecoration(
                        color:Colors.red,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child:Text('Cancelar',
                              style: TextStyle(
                                fontSize:16,
                                color:Colors.white,
                              ),
                              textAlign:TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: (){
          opciones(context);
          imagen == null ? Center() : Image.file(imagen);
        },
        child: Text('Selecciona una imagen'),
      ),

    );
  }

}














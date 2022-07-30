import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'dart:io';
ImagePicker picker = ImagePicker();

class Imagen extends StatefulWidget {
  @override
  _ImagenState createState() => _ImagenState();

}

class _ImagenState extends State<Imagen> {
  bool imageAvailable = false;
  late Uint8List imageFile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 140,
              width: 180,
              color: Colors.black12,

              child: imageAvailable ? Image.memory(imageFile) : const SizedBox(),
            ),
            GestureDetector(
              onTap: () async {
                final image = await ImagePickerWeb.getImageAsBytes();

                setState(() {
                  imageFile = image!;
                  imageAvailable = true;
                });
              },
              child: Container(
                height: 50,
                width: 200,
                color: Colors.blue,
                
                child: Center(
                  child: Text("Selecciona una imagen",
                    style: TextStyle(
                      fontSize:16,
                      color:Colors.white,
                    ),
                    textAlign:TextAlign.center,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
/*
  File? file;
  dynamic _path;
  dynamic _imagen64;
  final picker = ImagePicker();

  Future selImagen(op) async{
    var pickedFile;
    if (op==1){
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }
    if(pickedFile!= null){
      file = File(pickedFile.path);
    }else{
      print('No seleccionaste ninguna imagen');
    }

    setState((){
      file = File(pickedFile!.path);

    });


  }
  opciones(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
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
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1, color: Colors.grey))
                      ),
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
                      Navigator.of(context).pop();

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
    return
        Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 140,
                    width: 180,
                    color: Colors.black12,
                    child: file == null
                        ? Icon(
                      Icons.image,
                      size: 50,
                    )
                        : Image.file(
                      file!,
                      fit: BoxFit.fill,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      opciones(context);
                    },
                    child:
                    Text('Selecciona una imagen'),

                  ),



                ],


              ),
            )


        );



  }
*/
}














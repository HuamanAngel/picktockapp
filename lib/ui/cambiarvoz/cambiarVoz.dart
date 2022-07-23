import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

class Voz extends StatefulWidget {
  @override
  State<Voz> createState() => _CambiarVoz();
}
enum Voces { masculina, femenina, infantil }


class _CambiarVoz extends State<Voz> {
  final _formKey = GlobalKey<FormState>();


@override
  Widget build(BuildContext context) {
  FlutterTts flutterTts = FlutterTts();

  return Container(

      margin: EdgeInsets.only(top: 50, left: 100, right: 100, bottom: 50),
      child: Column(children: [

        SizedBox.fromSize(
          size: Size(56, 56), // button width and height
          child: ClipOval(
            child: Material(
              color: Colors.green, // button color
              child: InkWell(
                splashColor: Colors.lightGreen, // splash color
                onTap: () {

                   showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: const Text('Cambia tipo de voz '),
                          children: <Widget>[
                            SimpleDialogOption(
                              onPressed: () {
                                flutterTts.setLanguage("es-US-Standard-B");
                                flutterTts.speak("Virgencita");

                                Navigator.pop(context, Voces.masculina);
                              },
                              child: const Text('Masculina'),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context, Voces.femenina);
                              },
                              child: const Text('Femenina'),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context, Voces.infantil);
                              },
                              child: const Text('Infantil'),
                            ),
                          ],
                        );
                      });


                }, // button pressed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.hearing, color: Colors.white), // icon
                  ],
                ),
              ),
            ),
          ),
        )



      ]),
    );
  }
}


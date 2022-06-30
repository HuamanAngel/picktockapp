import 'package:flutter/material.dart';
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
    return Container(
      margin: EdgeInsets.only(top: 20, left: 100, right: 100, bottom: 50),
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

                child: SizedBox(
                  width: 56,
                  height: 56,
                  child: Icon(Icons.hearing, color: Colors.white), // icon
                ),
              ),
            ),
          ),
    );
  }
}


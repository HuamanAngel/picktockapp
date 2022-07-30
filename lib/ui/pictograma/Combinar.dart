import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import 'package:picktock/data/models/pictograma.dart';

class Combinar extends StatefulWidget {
  const Combinar({Key? key}) : super(key: key);
  @override
  State<Combinar> createState() => _CombinarPic();
}


class _CombinarPic extends State<Combinar> {
  FlutterTts flutterTts = FlutterTts();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.only( left: 50),
            child: FlatButton(
                child: Text(
                  "Combinar Pictograma",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Colors.green,
              onPressed: () {
                flutterTts.setLanguage("es-US-Standard-B");

                flutterTts.speak("Virgencita"+ "Es");

              },
            )
    );
  }
}

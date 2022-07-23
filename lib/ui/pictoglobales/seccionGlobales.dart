import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import 'package:picktock/ui/cambiarvoz/cambiarVoz.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_tts/flutter_tts.dart';


class Globales extends StatefulWidget {
  const Globales({Key? key}) : super(key: key);

  @override
  State<Globales> createState() => _PictogramaGlobal();
}

class _PictogramaGlobal extends State<Globales> {
  final controllerSearch = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
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
              Expanded(
                child:ordenar(icon: Icons.sort,text: "Alfabeto"),
                flex: 1,
              ),
              Expanded(
                child:ordenar(icon: Icons.sort,text: "Recientes"),
                flex: 1,
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
          Row(
            children: [
              Picto(),
              Picto(),
              Picto(),
              Picto(),
            ],
          ),
          Row(
              children: [
                Spacer(),
                Voz(),
              ]
          ),
          /* Row(
              child: Container(
                child: paginacion(),
              ),
          ),
*/
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
Widget Picto() {
  FlutterTts flutterTts = FlutterTts();

  return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              margin: EdgeInsets.only(top: 40),
              child: TextButton(
                onPressed: () async{
                  flutterTts.speak("Virgencita");
                },
                child: new Text('Virgencita'),
              ),

              /*Text('Virgencita',
                  style: TextStyle(fontSize: 20),
                  overflow: TextOverflow.ellipsis
              )*/
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Image.asset('assets/imagen.jpg'),
          ),
          Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  Text(
                    'Jose Feliciano',
                    style: TextStyle(color: Colors.grey),

                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
          ),



        ],
      )
  );
}


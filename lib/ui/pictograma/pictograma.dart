import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:picktock/ui/pictograma/cambiarvoz.dart';

class Pictograma extends StatefulWidget {
  const Pictograma({Key? key}) : super(key: key);

  @override
  State<Pictograma> createState() => _PictogramaState();
}

class _PictogramaState extends State<Pictograma> {
  final controllerSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
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
  return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              margin: EdgeInsets.only(top: 40),
              child: Text('Saluda',
                  style: TextStyle(fontSize: 20),
                  overflow: TextOverflow.ellipsis
              )
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Image.asset('assets/imagen.jpg'),
          ),

          Container(
              margin: EdgeInsets.only(top: 15, bottom: 10),
              child: Text('Calificación: 3',
                  style: TextStyle(fontSize: 20),
                  overflow: TextOverflow.ellipsis
              )
          ),
          Container(
         child: FlatButton(
          child: Text(
           "Cambiar Calificación",
          style: TextStyle(color: Colors.white, fontSize: 20),
            ),
         color: Colors.green,
         onPressed: () {}
         )
          )
        ],
      )
  );
}



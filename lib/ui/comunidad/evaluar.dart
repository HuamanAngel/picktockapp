import 'package:flutter/material.dart';
import 'package:picktock/styles/style.dart';
import 'package:picktock/ui/widgets/title.dart';

class EvaluateComunity extends StatefulWidget {
  EvaluateComunity({Key? key}) : super(key: key);

  @override
  State<EvaluateComunity> createState() => _EvaluateComunityState();
}

class _EvaluateComunityState extends State<EvaluateComunity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: styleContainer1['padding'],
      child: Column(children: [
        titleFirst(textTitle: "¿Aprobar el pictorama?"),
        SizedBox(height: 10),
        titleFirst(textTitle: "Saluda"),
        SizedBox(height: 10),
        Text("Pictograma"),
        Container(
          width: 400,
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  print("clear");
                },
              ),
              fillColor: Colors.red,
              border: OutlineInputBorder(),
              labelText: "Insertar razon de rechazo",
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(decoration: BoxDecoration(color: Colors.red), width: 100, margin: EdgeInsets.all(10) , child: ElevatedButton(onPressed: () {}, child: Text("X"))),
            Container(width: 100, margin: EdgeInsets.all(10) , child: ElevatedButton(onPressed: () {}, child: Text("O"))),
          ],
        )
      ]),
    );
  }
}

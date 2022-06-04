import 'package:flutter/material.dart';
import 'package:picktock/styles/style.dart';
import 'package:picktock/ui/widgets/title.dart';
import 'package:provider/provider.dart';
import 'package:picktock/domain/provider/menuProvider.dart';


class PendienteComunity extends StatefulWidget {
  PendienteComunity({Key? key}) : super(key: key);

  @override
  State<PendienteComunity> createState() => _PendienteComunityState();
}

class _PendienteComunityState extends State<PendienteComunity> {
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return Container(
      padding: styleContainer1['padding'],
      child: Column(children: [
        titleFirst(textTitle: "Selecionar pictograma a evaluar"),
        Text("Pictograma"),
        Text("Pictograma"),
        Text("Pictograma"),
        Text("Pictograma"),
        Text("Pictograma"),
        Text("Pictograma"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 10, left: 10,right: 10),
              child: ElevatedButton(onPressed: () { menuProvider.menu="Comunidad";}, child: Text("Atras")),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 10, left: 10,right: 10),
              child: ElevatedButton(onPressed: () { menuProvider.menu="Comunidad/Pendiente/idpictograma"; }, child: Text("Continuar")),
            ),
          ],
        )
      ]),
    );
  }
}

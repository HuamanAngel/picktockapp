import 'package:picktock/domain/provider/menuProvider.dart';
import 'package:flutter/material.dart';
import 'package:picktock/ui/enviarsugerencias/enviarSugerencias.dart';
import 'package:picktock/ui/option.dart';
import 'package:provider/provider.dart';
import 'package:picktock/ui/addpicto/addPicto.dart';
import 'package:picktock/ui/cambiarvoz/cambiarVoz.dart';
import 'package:picktock/ui/pictoglobales/seccionGlobales.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Login de acceso !!!",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Row(
            children: [
              SideBar(context, menuProvider),
              if (menuProvider.menu == "Inicio")
                Expanded(
                  child: Center(
                    child: Sugerencia(),
                  ),
                ),
              if (menuProvider.menu == "Perfil")
                Expanded(
                  child: Center(
                    child: Voz(),
                  ),
                ),
              if (menuProvider.menu == "Pictograma")
                Expanded(
                  child: Center(
                    child: Text("Pictograma"),
                  ),
                ),
              if (menuProvider.menu == "Globales")
                Expanded(
                  child: Center(
                    child: Globales(),
                  ),
                ),
            ],
          ),
        ));
  }
}
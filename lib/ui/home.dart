import 'package:picktock/domain/provider/menuProvider.dart';
import 'package:flutter/material.dart';
import 'package:picktock/ui/option.dart';
import 'package:provider/provider.dart';
import 'package:picktock/ui/categoria/categoria.dart';
import 'package:picktock/ui/login/login.dart';
import "package:picktock/ui/informacion/informacion.dart";
import 'package:picktock/ui/favorito/favorito.dart';

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
                  child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/textures/background.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Login(),
                  ),
                ),
              if (menuProvider.menu == "Perfil")
                Expanded(
                  child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/textures/background.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text("Perfil"),
                  ),
                ),
              if (menuProvider.menu == "Pictograma")
                Expanded(
                  child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/textures/background.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text("Pictograma"),
                  ),
                ),
              if (menuProvider.menu == "Agregar")
                Expanded(
                  child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/textures/background.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text("Agregar"),
                  ),
                ),
              if (menuProvider.menu == "Login")
                Expanded(
                  child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                    ),
                    child: Login(),
                  ),
                ),
              if (menuProvider.menu == "Favoritos")
                Expanded(
                  child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                    ),
                    child: Favorito(),
                  ),
                ),
              if (menuProvider.menu == "Configuracion")
                Expanded(
                  child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/textures/background.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text("Configuracion"),
                  ),
                ),
              if (menuProvider.menu == "Categoria")
                Expanded(
                  child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(color: Colors.amber.shade100),
                    child: AddCategoria(),
                  ),
                ),
              if (menuProvider.menu == "Informacion")
                Expanded(
                  child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                    ),
                    child: AboutUs(),
                  ),
                ),
            ],
          ),
        ));
  }
}

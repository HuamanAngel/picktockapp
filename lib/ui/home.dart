import 'package:picktock/domain/provider/menuProvider.dart';
import 'package:flutter/material.dart';
import 'package:picktock/ui/option.dart';
import 'package:provider/provider.dart';
import 'package:picktock/ui/ejemplo/Ejemplo2.dart';
import 'package:picktock/ui/pictograma/pictograma.dart';
import 'package:picktock/ui/comunidad/dash.dart';

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
                    child: Prueba(),
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
                    child: Pictograma(),
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
              if (menuProvider.menu == "Comunidad")
                Expanded(
                  child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/textures/background.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Comunidad(),
                  ),
                ),

                
            ],
          ),
        ));
  }
}

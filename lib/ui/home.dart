import 'package:picktock/domain/provider/menuProvider.dart';
import 'package:flutter/material.dart';
import 'package:picktock/ui/comunidad/evaluar.dart';
import 'package:picktock/ui/enviarsugerencias/enviarSugerencias.dart';
import 'package:picktock/ui/option.dart';
import 'package:picktock/ui/perfil/dash.dart';
import 'package:provider/provider.dart';
import 'package:picktock/ui/login/crear_usuario.dart';
import 'package:picktock/ui/pictograma/pictograma.dart';
import 'package:picktock/ui/comunidad/dash.dart';
import 'package:picktock/ui/comunidad/pendiente.dart';
import 'package:picktock/ui/categoria/categoria.dart';
import 'package:picktock/ui/login/login.dart';
import "package:picktock/ui/informacion/informacion.dart";
import 'package:picktock/ui/favorito/favorito.dart';
import 'package:picktock/ui/pictoglobales/seccionGlobales.dart';
import 'package:picktock/ui/pictograma/Agregar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return Scaffold(
      body: Row(
        children: [
          SideBar(menuProvider: menuProvider),
          Expanded(
            child: Routes(menuProvider: menuProvider),
          ) // comunityRoute(context: context, textMenu: "contribuir"),
        ],
      ),
    );
  }
}

class Routes extends StatelessWidget {
  final MenuProvider menuProvider;
  const Routes({Key? key, required this.menuProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (menuProvider.menu == "Inicio") {
      return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/textures/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Sugerencia(),
      );
    }
    if (menuProvider.menu == "Globales") {
      return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/textures/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: const  Globales(),
      );
    }
    if (menuProvider.menu == "Informacion") {
      return Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Colors.amber.shade100,
          image: const DecorationImage(
            image: AssetImage("assets/textures/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: AboutUs(),
      );
    }
    if (menuProvider.menu == "Login") {
      return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/textures/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Login(),
      );
    }

    if (menuProvider.menu == "Categoria") {
      return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/textures/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: AddCategoria(),
      );
    }

    if (menuProvider.menu == "Favoritos") {
      return Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Colors.amber.shade200,
          image: const DecorationImage(
            image: AssetImage("assets/textures/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Favorito(),
      );
    }
    if (menuProvider.menu == "Perfil") {
      return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/textures/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Perfil(),
      );
    }
    if (menuProvider.menu == "Pictograma") {
      return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/textures/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Pictograma(),
      );
    }
    if (menuProvider.menu == "Registro") {
      return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/textures/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Registro(),
      );
    }
    if (menuProvider.menu == "Agregar") {
      return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/textures/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Agregar(),
      );
    }
    if (menuProvider.menu == "Configuracion") {
      return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/textures/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Text("Configuracion"),
      );
    }

    if (menuProvider.menu == "Comunidad") {
      return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/textures/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Comunidad(),
      );
    }

    if (menuProvider.menu == "Comunidad/Contribuir") {
      return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/textures/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Text("Contribuir"),
      );
    }

    if (menuProvider.menu == "Comunidad/Pendiente") {
      return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/textures/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: PendienteComunity(),
      );
    }

    if (menuProvider.menu == "Comunidad/Donacion") {
      return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/textures/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Text("Donacion"),
      );
    }
    if (menuProvider.menu == "Comunidad/Pendiente/idpictograma") {
      return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/textures/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: EvaluateComunity(),
      );
    }
    if (menuProvider.menu == "AñadirPictograma") {
      return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/textures/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Pictograma(),
      );
    }
    return const SizedBox.shrink();
  }
}

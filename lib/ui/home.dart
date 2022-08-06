import 'package:picktock/domain/provider/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:picktock/ui/comunidad/evaluar.dart';
import 'package:picktock/ui/enviarsugerencias/enviarSugerencias.dart';
import 'package:picktock/ui/side_bar.dart';
import 'package:picktock/ui/perfil/dash.dart';
import 'package:provider/provider.dart';
import 'package:picktock/ui/login/register_page.dart';
import 'package:picktock/ui/pictograma/pictograma.dart';
import 'package:picktock/ui/comunidad/dash.dart';
import 'package:picktock/ui/comunidad/pendiente.dart';
import 'package:picktock/ui/categoria/categoria.dart';
import 'package:picktock/ui/login/login_page.dart';
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
      body: Container(
        color: Colors.blue.shade400,
        child: SafeArea(
          child: Row(
            children: [
              SideBar(menuProvider: menuProvider),
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 255, 237, 187),
                  child: Routes(menuProvider: menuProvider),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Routes extends StatelessWidget {
  final MenuProvider menuProvider;
  const Routes({Key? key, required this.menuProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (menuProvider.menu) {
      case "Inicio":
        return Sugerencia();
      case "Globales":
        return const Globales();
      case "Informacion":
        return AboutUs();
      case "Login":
        return const LoginPage();
      case "Categoria":
        return AddCategoria();
      case "Favoritos":
        return Favorito();
      case "Mi perfil":
        if (menuProvider.authPageState == AuthPageState.login) {
          return const LoginPage();
        } else if (menuProvider.authPageState == AuthPageState.register) {
          return const RegisterPage();
        } else {
          return Perfil();
        }
      case "Pictograma":
        return const Pictograma();
      case "Registro":
        return const RegisterPage();
      case "Agregar":
        return Agregar();
      case "Configuracion":
        return const Text("Configuracion");
      case "Comunidad":
        return Comunidad();
      case "Comunidad/Contribuir":
        return const Text("Contribuir");
      case "Comunidad/Pendiente":
        return PendienteComunity();
      case "Comunidad/Donacion":
        return const Text("Donacion");
      case "Comunidad/Pendiente/idpictograma":
        return EvaluateComunity();
      case "AñadirPictograma":
        return const Pictograma();
      default:
        return const RegisterPage();
    }
  }
}

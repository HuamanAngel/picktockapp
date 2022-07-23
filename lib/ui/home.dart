import 'package:picktock/domain/provider/menuProvider.dart';
import 'package:flutter/material.dart';
import 'package:picktock/ui/comunidad/evaluar.dart';
import 'package:picktock/ui/enviarsugerencias/enviarSugerencias.dart';
import 'package:picktock/ui/option.dart';
import 'package:picktock/ui/perfil/dash.dart';
import 'package:provider/provider.dart';
// import 'package:picktock/ui/ejemplo/Ejemplo2.dart';
import 'package:picktock/ui/login/crear_usuario.dart';
import 'package:picktock/ui/pictograma/pictograma.dart';
import 'package:picktock/ui/comunidad/dash.dart';
import 'package:picktock/ui/comunidad/pendiente.dart';
import 'package:picktock/ui/categoria/addCategorie.dart';
import 'package:picktock/ui/login/login.dart';
import "package:picktock/ui/informacion/informacion.dart";
import 'package:picktock/ui/favorito/favorito.dart';
import 'package:picktock/ui/addpicto/addPicto.dart';
import 'package:picktock/ui/cambiarvoz/cambiarVoz.dart';
import 'package:picktock/ui/pictoglobales/seccionGlobales.dart';
import 'package:picktock/ui/pictograma/Agregar.dart';
import 'package:picktock/ui/categoria/categories.dart';

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
              Expanded(
                child: _routes(menuProvider: menuProvider),
              ) // comunityRoute(context: context, textMenu: "contribuir"),
            ],
          ),
        ));
  }
}

Widget _routes({required menuProvider}) {
  if (menuProvider.menu == "Inicio")
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/textures/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Sugerencia(),
    );
  if (menuProvider.menu == "Globales")
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/textures/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Globales(),
    );
  /*if (menuProvider.menu == "Voz")
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/textures/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Voz(),
    );*/
  if (menuProvider.menu == "Informacion")
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        image: DecorationImage(
          image: AssetImage("assets/textures/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: AboutUs(),
    );
  if (menuProvider.menu == "Login")
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/textures/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Login(),
    );

  if (menuProvider.menu == "Categoria")
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/textures/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Categories(),
    );

  if (menuProvider.menu == "Favoritos")
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: Colors.amber.shade200,
        image: DecorationImage(
          image: AssetImage("assets/textures/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Favorito(),
    );
  if (menuProvider.menu == "Perfil")
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/textures/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Perfil(),
    );
  if (menuProvider.menu == "Pictograma")
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/textures/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Pictograma(),
    );
  if (menuProvider.menu == "Registro")
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/textures/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Registro(),
    );
  if (menuProvider.menu == "Agregar")
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/textures/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Agregar(),
    );
  if (menuProvider.menu == "Configuracion")
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/textures/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Text("Configuracion"),
    );

  if (menuProvider.menu == "Comunidad")
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/textures/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Comunidad(),
    );

  if (menuProvider.menu == "Comunidad/Contribuir")
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/textures/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Text("Contribuir"),
    );

  if (menuProvider.menu == "Comunidad/Pendiente")
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/textures/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: PendienteComunity(),
    );

  if (menuProvider.menu == "Comunidad/Donacion")
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/textures/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Text("Donacion"),
    );
  if (menuProvider.menu == "Comunidad/Pendiente/idpictograma")
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/textures/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: EvaluateComunity(),
    );
  if (menuProvider.menu == "AñadirPictograma")
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/textures/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      // child: Picto(name: "Saludar"),
      child: Container(child: Text("AñadirPictograma")),
    );
  // Widget widget  = menuRoute(context: context, textMenu: "Comunidad/Donacion", widget: Text("Donacion"));
  return SizedBox.shrink();
}

// Rutas comunity
Widget menuRoute(
    {required context, required textMenu, required Widget widget}) {
  final menuProvider = Provider.of<MenuProvider>(context);
  if (menuProvider.menu == textMenu) {
    return (Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/textures/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: widget,
    ));
  } else {
    return SizedBox.shrink();
  }
}

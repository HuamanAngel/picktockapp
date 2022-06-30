import 'package:picktock/domain/provider/menuProvider.dart';
import 'package:flutter/material.dart';
import 'package:picktock/ui/comunidad/evaluar.dart';
import 'package:picktock/ui/option.dart';
import 'package:picktock/ui/perfil/dash.dart';
import 'package:provider/provider.dart';
import 'package:picktock/ui/ejemplo/Ejemplo2.dart';
import 'package:picktock/ui/login/crear_usuario.dart';
import 'package:picktock/ui/pictograma/pictograma.dart';
import 'package:picktock/ui/comunidad/dash.dart';
import 'package:picktock/ui/comunidad/pendiente.dart';
import 'package:picktock/ui/pictograma/Agregar.dart';



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
                  ),
                ),
              Expanded(child: _routes(menuProvider: menuProvider))

              // Ruta para comunidad
              // comunityRoute(context: context, textMenu: "contribuir"),
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
      child: Prueba(),
    );
  if (menuProvider.menu == "Perfil")
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
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
  if (menuProvider.menu == "REGISTRO")
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
      child: Picto(),
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

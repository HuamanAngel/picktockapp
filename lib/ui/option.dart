import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:picktock/domain/provider/menuProvider.dart';

Widget SideBar(BuildContext context, MenuProvider menuProvider) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.blue,
      // color: Color.fromARGB(255, 177, 147, 57),
    ),
    width: 200,
    child: Column(
      children: [
        Container(
          child: const Text(
            "PickTock",
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        SideBarOption(
            text: "Inicio", icon: Icons.home, menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        /*SideBarOption(
            text: "Perfil", icon: Icons.person, menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),*/
        SideBarOption(
            text: "Pictograma",
            icon: Icons.photo_library,
            menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        // SideBarOption(
        //     text: "Voz", icon: Icons.mic, menuProvider: menuProvider),
        // const Divider(
        //   color: Colors.white,
        //   thickness: 1,
        // ),
        /*SideBarOption(
            text: "Registro",
            icon: Icons.photo_library,
            menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),*/
        SideBarOption(
            text: "Categoria",
            icon: Icons.category,
            menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        /*SideBarOption(
            text: "Comunidad", icon: Icons.people, menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),*/
        /*SideBarOption(
            text: "Globales",
            icon: Icons.person_pin_circle_sharp,
            menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),*/
        SideBarOptionBottom(
            text: "Agregar", icon: Icons.add, menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        // SideBarOptionBottom(
        //     text: "Favoritos", icon: Icons.star, menuProvider: menuProvider),
        // const Divider(
        //   color: Colors.white,
        //   thickness: 1,
        // ),
        // SideBarOptionBottom(
        //     text: "Editar", icon: Icons.edit, menuProvider: menuProvider),
        // const Divider(
        //   color: Colors.white,
        //   thickness: 1,
        // ),
        // SideBarOptionBottom(
        //     text: "Compartir", icon: Icons.share, menuProvider: menuProvider),
        // const Divider(
        //   color: Colors.white,
        //   thickness: 1,
        // ),
        // SideBarOptionBottom(
        //     text: "Editados",
        //     icon: Icons.edit_attributes,
        //     menuProvider: menuProvider),
        // const Divider(
        //   color: Colors.white,
        //   thickness: 1,
        // ),
        const Spacer(),
        SideBarOptionBottom(
            text: "Login", icon: Icons.exit_to_app, menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        SideBarOptionBottom(
            text: "Configuración",
            icon: Icons.settings,
            menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        SideBarOptionBottom(
            text: "Informacion", icon: Icons.info, menuProvider: menuProvider),
      ],
    ),
  );
}

Widget SideBarOption(
    {required String text,
    required IconData icon,
    required MenuProvider menuProvider}) {
  return InkWell(
    onTap: () {
      menuProvider.menu = text;
    },
    child: Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(text, style: TextStyle(color: Colors.white)),
        Icon(icon, color: Colors.white),
      ]),
    ),
  );
}

Widget SideBarOptionBottom(
    {required String text,
    required IconData icon,
    required MenuProvider menuProvider}) {
  return InkWell(
    onTap: () {
      menuProvider.menu = text;
    },
    child: Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(text, style: TextStyle(color: Colors.white)),
        Icon(icon, color: Colors.white),
      ]),
    ),
  );
}

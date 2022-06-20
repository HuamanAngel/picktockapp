import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:picktock/domain/provider/menuProvider.dart';

Widget SideBar(BuildContext context, MenuProvider menuProvider) {
  return Container(
    decoration: const BoxDecoration(
      color: Color.fromRGBO(33, 154, 235, 1),
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
        SideBarOption(
            text: "Perfil", icon: Icons.person, menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        SideBarOption(
            text: "Pictograma",
            icon: Icons.photo_library,
            menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        SideBarOption(
            text: "Categoria",
            icon: Icons.category,
            menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        SideBarOptionBottom(
            text: "Agregar", icon: Icons.add, menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        const Spacer(),
        SideBarOptionBottom(
            text: "Login", icon: Icons.exit_to_app, menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        SideBarOptionBottom(
            text: "Configuracion",
            icon: Icons.settings,
            menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        SideBarOptionBottom(
            text: "Informacion",
            icon: Icons.settings,
            menuProvider: menuProvider),
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

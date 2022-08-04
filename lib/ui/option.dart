
import 'package:flutter/material.dart';
import 'package:picktock/domain/provider/menuProvider.dart';

class SideBar extends StatelessWidget {
  final MenuProvider menuProvider;
  const SideBar({ Key? key, required this.menuProvider }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: const BoxDecoration(
      color: Colors.blue,
      // color: Color.fromARGB(255, 177, 147, 57),
    ),
    width: 200,
    child: ListView(
      children: [
        const Text(
          "PickTock",
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        SideBarOption(
            text: "Inicio", icon: Icons.home, menuProvider: menuProvider),
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
        SideBarOption(text: "Voz", icon: Icons.mic, menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        SideBarOption(
            text: "Registro",
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
        SideBarOption(
            text: "Comunidad", icon: Icons.people, menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        SideBarOption(
            text: "Globales",
            icon: Icons.person_pin_circle_sharp,
            menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        SideBarOption(
            text: "Agregar", icon: Icons.add, menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        SideBarOption(
            text: "Favoritos", icon: Icons.star, menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        SideBarOption(
            text: "Editar", icon: Icons.edit, menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        SideBarOption(
            text: "Compartir", icon: Icons.share, menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        SideBarOption(
            text: "Editados",
            icon: Icons.edit_attributes,
            menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        const Spacer(),
        SideBarOption(
            text: "Login", icon: Icons.exit_to_app, menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        SideBarOption(
            text: "Configuración",
            icon: Icons.settings,
            menuProvider: menuProvider),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        SideBarOption(
            text: "Informacion", icon: Icons.info, menuProvider: menuProvider),
      ],
    ),
  );
  }
}

class SideBarOption extends StatelessWidget {
  final String text;
  final IconData icon;
  final MenuProvider menuProvider;
  const SideBarOption(
      {Key? key,
      required this.text,
      required this.icon,
      required this.menuProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap: () {
      menuProvider.menu = text;
    },
    child: Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(text, style: const TextStyle(color: Colors.white)),
        Icon(icon, color: Colors.white),
      ]),
    ),
  );
  }
}


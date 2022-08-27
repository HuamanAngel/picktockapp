import 'package:flutter/material.dart';
import 'package:picktock/domain/provider/menu_provider.dart';

class SideBar extends StatelessWidget {
  final MenuProvider menuProvider;
  const SideBar({Key? key, required this.menuProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.ease,
      duration: const Duration(milliseconds: 300),
      width: menuProvider.isMenuOpen ? 200 : 40,
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: ListView(
        children: [
          GestureDetector(
            onTap: menuProvider.switchOpen,
            child: Container(
              height: 48,
              color: Colors.transparent,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: menuProvider.isMenuOpen
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Icon(Icons.menu),
                  ),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          "PickTock",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SideBarOption(
              text: "Inicio", icon: Icons.home, menuProvider: menuProvider),
          const Divider(),
          SideBarOption(
              text: "Pictograma",
              icon: Icons.photo_library,
              menuProvider: menuProvider),
          const Divider(),
          SideBarOption(
              text: "Voz", icon: Icons.mic, menuProvider: menuProvider),
          const Divider(),
          SideBarOption(
              text: "Categoria",
              icon: Icons.category,
              menuProvider: menuProvider),
          const Divider(),
          SideBarOption(
              text: "Comunidad",
              icon: Icons.people,
              menuProvider: menuProvider),
          const Divider(),
          SideBarOption(
              text: "Globales",
              icon: Icons.person_pin_circle_sharp,
              menuProvider: menuProvider),
          const Divider(),
          SideBarOption(
              text: "Agregar", icon: Icons.add, menuProvider: menuProvider),
          // const Divider(),
          // SideBarOption(
          //     text: "Favoritos", icon: Icons.star, menuProvider: menuProvider),
          // const Divider(),
          // SideBarOption(
          //     text: "Editar", icon: Icons.edit, menuProvider: menuProvider),
          // const Divider(),
          // SideBarOption(
          //     text: "Compartir", icon: Icons.share, menuProvider: menuProvider),
          // const Divider(),
          // SideBarOption(
          //     text: "Editados",
          //     icon: Icons.edit_attributes,
          //     menuProvider: menuProvider),
          const Divider(),
          SideBarOption(
              text: "Mi perfil",
              icon: Icons.person,
              menuProvider: menuProvider),
          const Divider(),
          SideBarOption(
              text: "Configuración",
              icon: Icons.settings,
              menuProvider: menuProvider),
          const Divider(),
          SideBarOption(
              text: "Informacion",
              icon: Icons.info,
              menuProvider: menuProvider),
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
        color: menuProvider.menu == text ? Colors.blue.shade800 : Colors.blue,
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: menuProvider.isMenuOpen
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color:
                      menuProvider.menu == text ? Colors.black : Colors.white,
                ),
              ),
            ),
            Icon(
              icon,
              color: menuProvider.menu == text ? Colors.black : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

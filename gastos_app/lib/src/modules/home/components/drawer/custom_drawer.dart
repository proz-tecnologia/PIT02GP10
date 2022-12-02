import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/home/components/drawer/drawer_menu_item.dart';
import 'package:gastos_app/src/modules/home/components/drawer/drawer_side_icon.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
    required this.onLogout,
  }) : super(key: key);

  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    final displaySize = MediaQuery.of(context).size;
    return SizedBox(
      width: displaySize.width * 0.7 + 12,
      child: Stack(
        fit: StackFit.loose,
        alignment: AlignmentDirectional.centerEnd,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Drawer(
              width: displaySize.width * 0.7,
              child: Column(
                children: [
                  DrawerMenuItem(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.account_circle_outlined,
                    title: "Perfil",
                  ),
                  DrawerMenuItem(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.settings_outlined,
                    title: "Configurações",
                  ),
                  DrawerMenuItem(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.contact_support_outlined,
                    title: "Ajuda",
                  ),
                  DrawerMenuItem(
                    onPressed: () {
                      onLogout();
                      Navigator.pop(context);
                    },
                    icon: Icons.exit_to_app_outlined,
                    title: "Sair",
                  ),
                ],
              ),
            ),
          ),
          const DrawerSideIcon()
        ],
      ),
    );
  }
}

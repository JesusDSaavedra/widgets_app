import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    return NavigationDrawer(
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      selectedIndex: navDrawerIndex,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(28, hasNotch ? 0 : 20, 26, 10),
          child: Text('Menu'),
        ),

        ...appMenuItems
            .sublist(0, 3)
            .map(
              (menu) => NavigationDrawerDestination(
                icon: Icon(menu.icon),
                label: Text(menu.title),
              ),
            ),

        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(28, hasNotch ? 0 : 20, 26, 10),
          child: Text('Más opciones'),
        ),

        ...appMenuItems
            .sublist(3)
            .map(
              (menu) => NavigationDrawerDestination(
                icon: Icon(menu.icon),
                label: Text(menu.title),
              ),
            ),
      ],
    );
  }
}

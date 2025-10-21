import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Count Riverpod',
    subtitle: 'Ccntador con Riverpod',
    link: '/counter',
    icon: Icons.plus_one_rounded,
  ),
  MenuItem(
    title: 'Botones',
    subtitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subtitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Snackbar & Dialogs',
    subtitle: 'Indicadores en pantalla',
    link: '/snackbars',
    icon: Icons.info_outline_rounded,
  ),
  MenuItem(
    title: 'Animated container',
    subtitle: 'Statefull widget animated',
    link: '/animated',
    icon: Icons.check_box_outline_blank_outlined,
  ),
  MenuItem(
    title: 'UI controls + tiles',
    subtitle: 'Una serie de controles en Flutter',
    link: '/ui-controls',
    icon: Icons.card_membership_sharp,
  ),
  MenuItem(
    title: 'Tutotrial App',
    subtitle: 'Pequeño tutorial de la app',
    link: '/tutorial',
    icon: Icons.accessibility_new_outlined,
  ),
  MenuItem(
    title: 'InfiniteScroll & Pull',
    subtitle: 'Infinite scroll and pull refresh',
    link: '/infinite',
    icon: Icons.list_alt_outlined,
  ),
  MenuItem(
    title: 'Tema App',
    subtitle: 'Modificar tema de la aplicación.',
    link: '/theme-changer',
    icon: Icons.dark_mode_outlined,
  ),
];

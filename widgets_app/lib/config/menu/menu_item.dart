import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
  });
  
}

const appMenuItems = <MenuItem>[

  MenuItem(
    title: 'Botones', 
    subTitle: 'Tipos de botones', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined
  ),

  MenuItem(
    title: 'Tajertas', 
    subTitle: 'Tipos de tarjetas (CARD?)', 
    link: '/cards', 
    icon: Icons.card_travel
  ),

  MenuItem(
    title: 'Progress Indicators', 
    subTitle: 'Generales y Controlados', 
    link: '/progress', 
    icon: Icons.refresh_rounded
  ),
];

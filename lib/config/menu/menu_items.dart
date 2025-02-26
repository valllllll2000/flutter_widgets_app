import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Riverpod Counter',
      subTitle: 'Riverpod intro',
      link: '/counter',
      icon: Icons.ad_units_rounded),
  MenuItem(
      title: 'Buttons',
      subTitle: 'Flutter buttons',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Cards',
      subTitle: 'Styled container',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Progress Indicators',
      subTitle: 'Generals and controlled',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snackbars and dialogs',
      subTitle: 'Screen indicators',
      link: '/snackbars',
      icon: Icons.info_outline),
  MenuItem(
      title: 'Animated container',
      subTitle: 'Animated stateful widget',
      link: '/animated',
      icon: Icons.check_box_outline_blank_rounded),
  MenuItem(
      title: 'UI controls',
      subTitle: 'A few controls',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined),
  MenuItem(
      title: 'App tutorial',
      subTitle: 'How to use the app',
      link: '/tutorial',
      icon: Icons.info_outline),
  MenuItem(
      title: 'Infinite scroll',
      subTitle: 'Scrolling to the infinite and pull to refresh',
      link: '/infinite',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Theme changer',
      subTitle: 'Theme changer screen',
      link: '/theme-changer',
      icon: Icons.colorize_rounded),
];

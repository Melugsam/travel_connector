import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widget/nav_bar_item_widget.dart';

class NavigationScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const NavigationScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: navigationShell,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavbarItemWidget(
              isSelected: navigationShell.currentIndex == 0,
              onTap: () {
                navigationShell.goBranch(0);
              },
              iconData: Icons.home_filled,
              label: "Главная",
            ),
            NavbarItemWidget(
              isSelected: navigationShell.currentIndex == 1,
              onTap: () {
                navigationShell.goBranch(1);
              },
              iconData: Icons.search,
              label: "Поиск",
            ),
            NavbarItemWidget(
              isSelected: navigationShell.currentIndex == 2,
              onTap: () {
                navigationShell.goBranch(2);
              },
              iconData: Icons.person_2,
              label: "Профиль",
            ),
          ],
        ),
      ),
    );
  }
}

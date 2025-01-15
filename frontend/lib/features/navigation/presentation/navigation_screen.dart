import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_connector/core/injector/di.dart';
import 'package:travel_connector/features/newsfeed/presentation/bloc/post/post_bloc.dart';
import 'package:travel_connector/features/newsfeed/presentation/bloc/post_like/post_like_bloc.dart';
import 'package:travel_connector/features/newsfeed/presentation/bloc/post_write_comment/post_write_comment_bloc.dart';

import 'widget/nav_bar_item_widget.dart';

class NavigationScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const NavigationScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PostBloc(
                getIt(),
                getIt(),
              ),
        ),
        BlocProvider(
          create: (context) => PostLikeBloc(
            getIt(),
            getIt(),
          ),
        ),
        BlocProvider(
          create: (context) => PostWriteCommentBloc(
            getIt(),
            getIt(),
          ),
        ),
      ],
      child: Scaffold(
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
      ),
    );
  }
}

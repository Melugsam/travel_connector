import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_connector/core/injector/di.dart';
import 'package:travel_connector/features/search/presentation/bloc/city/city_bloc.dart';
import 'package:travel_connector/features/search/presentation/bloc/hotel/hotel_bloc.dart';
import 'package:travel_connector/features/search/presentation/hotel_screen.dart';
import 'package:travel_connector/features/search/presentation/widget/search_map_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CityBloc(
            getIt(),
          ),
        ),
        BlocProvider(
          create: (context) => HotelBloc(
            getIt(),
          ),
        ),
      ],
      child: Builder(
        builder: (context) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: Text("Поиск"),
                bottom: TabBar(
                  tabs: [
                    Tab(text: "Карта"),
                    Tab(text: "Отели"),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  SearchMapWidget(),
                  HotelScreen(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_connector/core/injector/di.dart';
import 'package:travel_connector/features/search/presentation/bloc/city/city_bloc.dart';
import 'package:travel_connector/features/search/presentation/bloc/hotel/hotel_bloc.dart';
import 'package:travel_connector/features/search/presentation/bloc/places/places_bloc.dart';
import 'package:travel_connector/features/search/presentation/bloc/tab_controller/tab_controller_cubit.dart';
import 'package:travel_connector/features/search/presentation/bloc/weather/weather_bloc.dart';
import 'package:travel_connector/features/search/presentation/hotel_screen.dart';
import 'package:travel_connector/features/search/presentation/place_screen.dart';
import 'package:travel_connector/features/search/presentation/weather_screen.dart';
import 'package:travel_connector/features/search/presentation/widget/search_map_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
        BlocProvider(
          create: (context) => PlacesBloc(
            getIt(),
          ),
        ),
        BlocProvider(
          create: (context) => WeatherBloc(
            getIt(),
            getIt(),
          ),
        ),
        BlocProvider(
          create: (context) => TabControllerCubit(),
        ),
      ],
      child: BlocConsumer<TabControllerCubit, int>(
        listener: (context, tabIndex) {
          if (_tabController.index != tabIndex) {
            _tabController.animateTo(tabIndex);
          }
        },
        builder: (context, tabIndex) {
          return DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                title: Text("Поиск"),
                bottom: TabBar(
                  controller: _tabController,
                  onTap: (index) =>
                      context.read<TabControllerCubit>().changeTab(index),
                  tabs: [
                    Tab(text: "Карта"),
                    Tab(text: "Отели"),
                    Tab(text: "Погода"),
                    Tab(text: "Места"),
                  ],
                ),
              ),
              body: TabBarView(
                controller: _tabController,
                children: [
                  SearchMapWidget(),
                  HotelScreen(),
                  WeatherScreen(),
                  PlaceScreen(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

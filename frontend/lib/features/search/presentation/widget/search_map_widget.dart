import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:travel_connector/core/color/app_colors.dart';
import 'package:travel_connector/core/constant/url.dart';
import 'package:travel_connector/core/widget/custom_button_widget.dart';
import 'package:travel_connector/core/widget/custom_circular_indicator_widget.dart';
import 'package:travel_connector/core/widget/custom_text_field_widget.dart';
import 'package:travel_connector/features/search/presentation/bloc/city/city_bloc.dart';
import 'package:travel_connector/features/search/presentation/bloc/hotel/hotel_bloc.dart';
import 'package:travel_connector/features/search/presentation/bloc/map/search_map_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchMapWidget extends StatelessWidget {
  final cityController = TextEditingController();

  SearchMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchMapCubit(),
      child: Stack(
        children: [
          _buildMap(context),
          _buildPanel(context),
        ],
      ),
    );
  }

  Widget _buildMap(BuildContext context) {
    return BlocBuilder<SearchMapCubit, LatLng>(
      builder: (context, mapPoint) {
        return FlutterMap(
          options: MapOptions(
            initialCenter: mapPoint,
            initialZoom: 8.2,
            onTap: (tapPosition, point) {
              context.read<SearchMapCubit>().updateLocation(point);
            },
          ),
          children: [
            TileLayer(urlTemplate: stadiaMapsUrl),
            MarkerLayer(
              markers: [
                Marker(
                  point: mapPoint,
                  child: const Icon(
                    Icons.location_on,
                    color: AppColors.primary,
                    size: 32,
                  ),
                )
              ],
            ),
            _buildMapAttribution(),
          ],
        );
      },
    );
  }

  Widget _buildPanel(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 8,
            children: [
              _buildSearchField(context),
              _buildCityPredictor(),
            ],
          ),
          _buildSearchButton(context),
        ],
      ),
    );
  }

  Widget _buildSearchField(
      BuildContext context) {
    return CustomTextFieldWidget(
      controller: cityController,
      onChanged: (value) {
        context.read<CityBloc>().add(FetchCityEvent(cityName: value));
      },
      hintText: "Поиск по городу",
      border: false,
    );
  }

  Widget _buildSearchButton(BuildContext context) {
    return CustomButtonWidget(
      text: "Найти",
      onPressed: () {
        final mapPoint = context.read<SearchMapCubit>().state;
        context.read<HotelBloc>().add(
              FetchHotelEvent(
                latitude: mapPoint.latitude,
                longitude: mapPoint.longitude,
              ),
            );
      },
    );
  }

  Widget _buildMapAttribution() {
    return RichAttributionWidget(
      animationConfig: const ScaleRAWA(),
      attributions: [
        TextSourceAttribution(
          textStyle: const TextStyle(fontSize: 16),
          'Stadia Maps',
          onTap: () => launchUrl(Uri.parse('https://stadiamaps.com/')),
        ),
        TextSourceAttribution(
          textStyle: const TextStyle(fontSize: 16),
          'OpenMapTiles',
          onTap: () => launchUrl(Uri.parse('https://openmaptiles.org/')),
        ),
        TextSourceAttribution(
          textStyle: const TextStyle(fontSize: 16),
          'OpenStreetMap',
          onTap: () =>
              launchUrl(Uri.parse('https://www.openstreetmap.org/copyright')),
        ),
      ],
    );
  }

  Widget _buildCityPredictor() {
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) {
        return AnimatedContainer(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          width: double.infinity,
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 300),
          height: state is CityInitial ? 0 : 150,
          child: Builder(
            builder: (context) {
              if (state is CityLoading) {
                return CustomCircularIndicatorWidget();
              }
              if (state is CityEmpty || state is CityError) {
                return Center(
                  child: Text(
                    "Не удалось найти по заданным параметрам",
                    textAlign: TextAlign.center,
                  ),
                );
              }
              if (state is CitySuccess) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.cities.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        context.read<SearchMapCubit>().updateLocation(
                              LatLng(
                                state.cities[index].latitude,
                                state.cities[index].longitude,
                              ),
                            );
                        context
                            .read<CityBloc>()
                            .add(FetchCityEvent(cityName: ''),);
                        cityController.clear();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Wrap(
                          children: [
                            Text(
                              '${state.cities[index].name}, ',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              '${state.cities[index].country} ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return SizedBox.shrink();
            },
          ),
        );
      },
    );
  }
}

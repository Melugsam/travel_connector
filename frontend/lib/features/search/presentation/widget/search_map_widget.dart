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
import 'package:url_launcher/url_launcher.dart';

class SearchMapWidget extends StatefulWidget {
  const SearchMapWidget({super.key});

  @override
  State<SearchMapWidget> createState() => _SearchMapWidgetState();
}

class _SearchMapWidgetState extends State<SearchMapWidget> {
  final cityController = TextEditingController();
  LatLng _mapPoint = const LatLng(55.748886, 37.617209);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          key: ValueKey(_mapPoint),
          options: MapOptions(
            initialCenter: _mapPoint,
            initialZoom: 8.2,
            onTap: (tapPosition, point) {
              setState(() {
                _mapPoint = point;
              });
            },
          ),
          children: [
            TileLayer(
              urlTemplate: stadiaMapsUrl,
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: _mapPoint,
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.redAccent,
                    size: 32,
                  ),
                  width: 80.0,
                  height: 80.0,
                )
              ],
            ),
            RichAttributionWidget(
              animationConfig: const ScaleRAWA(),
              attributions: [
                TextSourceAttribution(
                  textStyle: const TextStyle(fontSize: 16),
                  'Stadia Maps',
                  onTap: () => launchUrl(
                    Uri.parse('https://stadiamaps.com/'),
                  ),
                ),
                TextSourceAttribution(
                  textStyle: const TextStyle(fontSize: 16),
                  'OpenMapTiles',
                  onTap: () => launchUrl(
                    Uri.parse('https://openmaptiles.org/'),
                  ),
                ),
                TextSourceAttribution(
                  textStyle: const TextStyle(fontSize: 16),
                  'OpenStreetMap',
                  onTap: () => launchUrl(
                    Uri.parse('https://www.openstreetmap.org/copyright'),
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomTextFieldWidget(
                    onChanged: (value) {
                      context.read<CityBloc>().add(
                            FetchCityEvent(keyword: value),
                          );
                    },
                    controller: cityController,
                    hintText: "Поиск по городу",
                    border: false,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  BlocBuilder<CityBloc, CityState>(
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
                            if (state is CityEmpty) {
                              return Center(
                                child: Text(
                                  "Не удалось найти по заданным параметрам",
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
                                      setState(() {
                                        _mapPoint = LatLng(
                                          state.cities[index].latitude,
                                          state.cities[index].longitude,
                                        );
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 6),
                                      child: Text(
                                        state.cities[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
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
                  ),
                ],
              ),
              CustomButtonWidget(
                text: "Найти",
                onPressed: () {
                  context.read<HotelBloc>().add(
                        FetchHotelEvent(
                          latitude: _mapPoint.latitude,
                          longitude: _mapPoint.longitude,
                        ),
                      );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

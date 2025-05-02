import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:travel_connector/core/color/app_colors.dart';
import 'package:travel_connector/core/constant/url.dart';
import 'package:travel_connector/core/injector/di.dart';
import 'package:travel_connector/core/widget/custom_circular_indicator_widget.dart';
import 'package:travel_connector/core/widget/custom_text_field_widget.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_response_model.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_create_entity.dart';
import 'package:travel_connector/features/search/presentation/bloc/city/city_bloc.dart';
import 'package:travel_connector/features/search/presentation/bloc/search_map_point/search_map_point_cubit.dart';

class AddMapScreen extends StatefulWidget {
  final MapRouteModel? initialRoute;
  final bool isViewMode;

  const AddMapScreen({super.key, this.initialRoute, this.isViewMode = false,});

  @override
  State<AddMapScreen> createState() => _AddMapScreenState();
}

class _AddMapScreenState extends State<AddMapScreen> {
  final mapController = MapController();
  final cityController = TextEditingController();
  final FocusNode cityFocusNode = FocusNode();

  late List<CustomMarkerUi> markers;
  late List<RouteConnectionUi> routeLines;
  Offset _tapPosition = Offset.zero;

  int _hotelCounter = 1;
  int _attractionCounter = 1;
  int _restaurantCounter = 1;

  @override
  void initState() {
    super.initState();
    markers = [
      ...(widget.initialRoute?.markers.map(CustomMarkerUi.fromBase) ?? [])
    ];
    routeLines = [
      ...(widget.initialRoute?.routes.map(
            (r) => RouteConnectionUi.fromBase(r, widget.initialRoute!.markers),
      ) ?? [])
    ];
  }

  void _addMarker(String type, LatLng point) {
    String defaultLabel;
    if (type == 'hotel') {
      defaultLabel = 'Отель ${_hotelCounter++}';
    } else if (type == 'attraction') {
      defaultLabel = 'Достопримечательность ${_attractionCounter++}';
    } else if (type == 'restaurant') {
      defaultLabel = 'Ресторан ${_restaurantCounter++}';
    } else {
      defaultLabel = 'Объект';
    }
    final marker = CustomMarkerUi(
        point: point, type: type, label: defaultLabel);
    setState(() => markers.add(marker));
  }

  void _removeMarker(CustomMarkerUi marker) {
    setState(() {
      markers.remove(marker);
      routeLines.removeWhere((line) =>
      line.from == marker || line.to == marker);
    });
  }

  void _removeRoutesOf(CustomMarkerUi marker) {
    setState(() =>
        routeLines.removeWhere((line) =>
        line.from == marker || line.to == marker));
  }

  void _renameMarker(CustomMarkerUi marker) async {
    final name = await showDialog<String>(
      context: context,
      builder: (context) {
        final controller = TextEditingController(text: marker.label);
        return AlertDialog(
          title: const Text("Введите название"),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: "Название"),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, null),
                child: const Text("Отмена")),
            TextButton(
                onPressed: () => Navigator.pop(context, controller.text.trim()),
                child: const Text("Сохранить")),
          ],
        );
      },
    );
    if (name != null && name.isNotEmpty) {
      setState(() => marker.label = name);
    }
  }

  void _buildRouteFrom(CustomMarkerUi fromMarker) async {
    final target = await showDialog<CustomMarkerUi>(
      context: context,
      builder: (context) =>
          SimpleDialog(
            title: const Text('Построить маршрут к...'),
            children: markers
                .where((m) => m != fromMarker)
                .map((m) =>
                SimpleDialogOption(
                  onPressed: () => Navigator.pop(context, m),
                  child: Text(m.label ?? 'Без названия'),
                )).toList(),
          ),
    );
    if (target != null) {
      setState(() =>
          routeLines.add(RouteConnectionUi(from: fromMarker, to: target)));
    }
  }

  void _onMarkerTap(CustomMarkerUi marker) async {
    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
          _tapPosition.dx, _tapPosition.dy, _tapPosition.dx, _tapPosition.dy),
      color: Colors.white,
      items: const [
        PopupMenuItem(value: 'rename', child: Text('Переименовать')),
        PopupMenuItem(value: 'delete', child: Text('Удалить')),
        PopupMenuItem(value: 'route', child: Text('Построить маршрут')),
        PopupMenuItem(value: 'remove_routes', child: Text('Удалить маршруты')),
      ],
    );
    switch (selected) {
      case 'delete':
        _removeMarker(marker);
        break;
      case 'rename':
        _renameMarker(marker);
        break;
      case 'route':
        _buildRouteFrom(marker);
        break;
      case 'remove_routes':
        _removeRoutesOf(marker);
        break;
    }
  }

  void _showPopupMenu(BuildContext context, LatLng latLng,
      Offset tapPosition) async {
    final overlay = Overlay
        .of(context)
        .context
        .findRenderObject() as RenderBox;
    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromRect(
          tapPosition & const Size(40, 40), Offset.zero & overlay.size),
      color: Colors.white,
      items: const [
        PopupMenuItem(value: 'hotel', child: Text('Отель')),
        PopupMenuItem(
            value: 'attraction', child: Text('Достопримечательность')),
        PopupMenuItem(value: 'restaurant', child: Text('Ресторан')),
      ],
    );
    if (selected != null) _addMarker(selected, latLng);
  }

  Marker _buildMarker(CustomMarkerUi marker) =>
      Marker(
        point: marker.point,
        width: 80,
        height: marker.label != null ? 70 : 50,
        child: GestureDetector(
          onTap: () => _onMarkerTap(marker),
          child: Column(
            children: [
              Icon(marker.icon, color: marker.color, size: 32),
              if (marker.label != null && marker.label!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 4)
                      ],
                    ),
                    child: Text(
                        marker.label!, style: const TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
            ],
          ),
        ),
      );

  void _submitAndReturn() {
    int findIndexByMarker(List<MarkerModel> markers, CustomMarkerUi marker) {
      return markers.indexWhere((m) =>
      m.point.latitude == marker.point.latitude &&
          m.point.longitude == marker.point.longitude &&
          m.type == marker.type &&
          m.label == marker.label);
    }

    final baseMarkers = markers.map((m) => m.toBase()).toList();

    final route = MapRouteModel(
      markers: baseMarkers,
      routes: routeLines.map((r) {
        final fromIndex = findIndexByMarker(baseMarkers, r.from);
        final toIndex = findIndexByMarker(baseMarkers, r.to);
        return RouteConnectionModel(fromIndex: fromIndex, toIndex: toIndex);
      }).toList(),
    );

    Navigator.pop(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.isViewMode ? "Маршрут пользователя" : "Добавление на карту"),
        actions: widget.isViewMode
            ? null
            : [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _submitAndReturn,
            tooltip: 'Сохранить маршрут',
          ),
        ],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CityBloc(getIt())),
          BlocProvider(create: (context) => SearchMapPointCubit()),
        ],
        child: BlocBuilder<SearchMapPointCubit, LatLng>(
          builder: (context, mapPoint) {
            return Stack(
              children: [
                Listener(
                  onPointerDown: (event) => _tapPosition = event.position,
                  child: FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                        initialCenter: markers.isNotEmpty
                            ? markers.first.point
                            : mapPoint,
                        initialZoom: 12.2,
                        onTap: (tapPos, latLng) {
                          if (!widget.isViewMode){

                          _showPopupMenu(context, latLng, _tapPosition);
                          }
                        }
                    ),
                    children: [
                      TileLayer(urlTemplate: geoapifyMapUrl),
                      PolylineLayer(
                        polylines: routeLines.map((route) =>
                            Polyline(
                              points: [route.from.point, route.to.point],
                              color: Colors.green,
                              strokeWidth: 3.5,
                            )).toList(),
                      ),
                      MarkerLayer(markers: markers.map(_buildMarker).toList()),
                    ],
                  ),
                ),
                if (!widget.isViewMode)
                  Align(
                    alignment: Alignment.topCenter,
                    child: _buildCitySearchPanel(context),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCitySearchPanel(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFieldWidget(
            controller: cityController,
            focusNode: cityFocusNode,
            onChanged: (value) =>
                context.read<CityBloc>().add(FetchCityEvent(cityName: value)),
            hintText: "Поиск по городу",
            border: false,
          ),
          const SizedBox(height: 8),
          _buildCityPredictor(),
        ],
      ),
    );
  }

  Widget _buildCityPredictor() {
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) {
        return AnimatedContainer(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))
            ],
          ),
          width: double.infinity,
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 300),
          height: state is CityInitial ? 0 : 150,
          child: Builder(
            builder: (context) {
              if (state is CityLoading)
                return const CustomCircularIndicatorWidget();
              if (state is CityEmpty || state is CityError) {
                return const Center(child: Text(
                    "Не удалось найти по заданным параметрам",
                    textAlign: TextAlign.center));
              }
              if (state is CitySuccess) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.cities.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        final latLng = LatLng(state.cities[index].latitude,
                            state.cities[index].longitude);
                        context.read<SearchMapPointCubit>().updateLocation(
                            latLng);
                        mapController.move(latLng, mapController.camera.zoom);
                        context.read<CityBloc>().add(
                            FetchCityEvent(cityName: ''));
                        cityController.clear();
                        cityFocusNode.unfocus();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Wrap(
                          children: [
                            Text('${state.cities[index].name}, ', style: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium),
                            Text('${state.cities[index].country} ', style: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        );
      },
    );
  }
}

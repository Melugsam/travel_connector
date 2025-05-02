import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_response_model.dart';

class PostCreateEntity {
  final String description;
  final List<String> imageUrls;
  final MapRouteModel? route;

  PostCreateEntity({
    required this.description,
    required this.imageUrls,
    this.route,
  });
}

class CustomMarker {
  final LatLng point;
  final String type;
  final String? label;

  CustomMarker({
    required this.point,
    required this.type,
    this.label,
  });
}

class RouteConnection {
  final CustomMarker from;
  final CustomMarker to;

  RouteConnection({
    required this.from,
    required this.to,
  });
}

class CustomMarkerUi {
  final LatLng point;
  final String type;
  String label; // Убрали final

  CustomMarkerUi({
    required this.point,
    required this.type,
    required this.label,
  });

  factory CustomMarkerUi.fromBase(MarkerModel model) {
    return CustomMarkerUi(
      point: LatLng(model.point.latitude, model.point.longitude),
      type: model.type,
      label: model.label ?? '',
    );
  }

  MarkerModel toBase() {
    return MarkerModel(
      point: LatLngModel(
        latitude: point.latitude,
        longitude: point.longitude,
      ),
      type: type,
      label: label,
    );
  }

  IconData get icon => switch (type) {
    'hotel' => Icons.hotel,
    'attraction' => Icons.museum,
    'restaurant' => Icons.restaurant,
    _ => Icons.place,
  };

  Color get color => switch (type) {
    'hotel' => Colors.blue,
    'attraction' => Colors.deepPurple,
    'restaurant' => Colors.redAccent,
    _ => Colors.grey,
  };
}
class RouteConnectionUi {
  final CustomMarkerUi from;
  final CustomMarkerUi to;

  RouteConnectionUi({required this.from, required this.to});

  static RouteConnectionUi fromBase(RouteConnectionModel model, List<MarkerModel> allMarkers) {
    final fromMarker = allMarkers[model.fromIndex];
    final toMarker = allMarkers[model.toIndex];
    return RouteConnectionUi(
      from: CustomMarkerUi.fromBase(fromMarker),
      to: CustomMarkerUi.fromBase(toMarker),
    );
  }
}

part of 'places_bloc.dart';

sealed class PlacesEvent {}

final class FetchPlacesEvent extends PlacesEvent {
  final double latitude;
  final double longitude;
  final String keyword;

  FetchPlacesEvent({required this.latitude, required this.longitude, required this.keyword});
}

part of 'places_bloc.dart';

sealed class PlacesState {}

final class PlacesInitial extends PlacesState {}

final class PlacesSuccess extends PlacesState {
  final List<PlaceEntity> places;

  PlacesSuccess({required this.places});
}

final class PlacesError extends PlacesState {
  final String message;

  PlacesError({required this.message});
}

final class PlacesLoading extends PlacesState {}

final class PlacesEmpty extends PlacesState {}

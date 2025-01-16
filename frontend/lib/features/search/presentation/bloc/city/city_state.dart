part of 'city_bloc.dart';

sealed class CityState {}

final class CityInitial extends CityState {}

final class CitySuccess extends CityState {
  final List<CityEntity> cities;

  CitySuccess({required this.cities});
}

final class CityError extends CityState {
  final String message;

  CityError({required this.message});
}

final class CityLoading extends CityState {}

final class CityEmpty extends CityState {}

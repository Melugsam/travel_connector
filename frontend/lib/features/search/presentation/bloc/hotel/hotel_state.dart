part of 'hotel_bloc.dart';

sealed class HotelState {}

final class HotelInitial extends HotelState {}

final class HotelSuccess extends HotelState {
  final List<HotelEntity> hotels;

  HotelSuccess({required this.hotels});
}

final class HotelError extends HotelState {
  final String message;

  HotelError({required this.message});
}

final class HotelLoading extends HotelState {}

final class HotelEmpty extends HotelState {}

part of 'hotel_bloc.dart';

sealed class HotelEvent {}

final class FetchHotelEvent extends HotelEvent {
  final double latitude;
  final double longitude;

  FetchHotelEvent({
    required this.latitude,
    required this.longitude,
  });
}

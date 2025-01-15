part of 'hotel_bloc.dart';

sealed class HotelEvent {}

final class FetchHotelEvent extends HotelEvent {
  final double latitude;
  final double longitude;
  final String checkIn;
  final String checkOut;

  FetchHotelEvent(
      {required this.latitude,
      required this.longitude,
      required this.checkIn,
      required this.checkOut});
}

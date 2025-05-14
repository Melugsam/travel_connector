part of 'place_photo_bloc.dart';

@immutable
sealed class PlacePhotoState {}

final class PlacePhotoInitial extends PlacePhotoState {}


class PlacePhotoLoading extends PlacePhotoState {}

class PlacePhotoSuccess extends PlacePhotoState {
  final Uint8List imageBytes;

  PlacePhotoSuccess(this.imageBytes);
}

class PlacePhotoError extends PlacePhotoState {
  final String message;

  PlacePhotoError(this.message);
}
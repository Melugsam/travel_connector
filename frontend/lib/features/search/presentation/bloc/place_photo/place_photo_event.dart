part of 'place_photo_bloc.dart';

@immutable
sealed class PlacePhotoEvent {}

class LoadPlacePhoto extends PlacePhotoEvent {
  final String photoReference;

  LoadPlacePhoto(this.photoReference);
}
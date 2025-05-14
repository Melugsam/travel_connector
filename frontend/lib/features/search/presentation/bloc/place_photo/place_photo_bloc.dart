import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_connector/core/constant/api_keys.dart';

part 'place_photo_event.dart';
part 'place_photo_state.dart';

class PlacePhotoBloc extends Bloc<PlacePhotoEvent, PlacePhotoState> {
  PlacePhotoBloc() : super(PlacePhotoInitial()) {
    on<LoadPlacePhoto>(_onLoadPlacePhoto);
  }

  Future<void> _onLoadPlacePhoto(
      LoadPlacePhoto event, Emitter<PlacePhotoState> emit) async {
    emit(PlacePhotoLoading());

    final url = Uri.parse(
      'https://google-map-places.p.rapidapi.com/maps/api/place/photo?photo_reference=${event.photoReference}&maxwidth=400',
    );

    final headers = {
      'x-rapidapi-key': rapidApiKey,
      'x-rapidapi-host': 'google-map-places.p.rapidapi.com',
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        emit(PlacePhotoSuccess(response.bodyBytes));
      } else {
        emit(PlacePhotoError('Ошибка загрузки: ${response.statusCode}'));
      }
    } catch (e) {
      emit(PlacePhotoError('Сетевая ошибка: $e'));
    }
  }
}


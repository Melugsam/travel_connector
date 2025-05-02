import 'package:bloc/bloc.dart';
import 'package:latlong2/latlong.dart';

class SearchMapPointCubit extends Cubit<LatLng> {
  SearchMapPointCubit()
      : super(
          const LatLng(55.748886, 37.617209),
        );

  void updateLocation(LatLng mapPoint) {
    emit(mapPoint);
  }
}

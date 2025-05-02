import 'package:bloc/bloc.dart';
import 'package:travel_connector/features/search/domain/entity/places_entity.dart';
import 'package:travel_connector/features/search/domain/usecase/places_usecase.dart';

part 'places_event.dart';

part 'places_state.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  final PlacesUseCase _placesUseCase;

  PlacesBloc(this._placesUseCase) : super(PlacesInitial()) {
    on<FetchPlacesEvent>((event, emit) async {
      emit(PlacesLoading());
      final result = await _placesUseCase(
        event.latitude,
        event.longitude,
        event.keyword,
      );
      result.fold(
        (l) => emit(
          PlacesError(message: l.message),
        ),
            (r) {
          if (r.places.isEmpty) {
            emit(PlacesEmpty());
          } else {
            emit(
              PlacesSuccess(places: r.places),
            );
          }
        },
      );
    });
  }
}

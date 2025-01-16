import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:travel_connector/features/search/domain/entity/city_entity.dart';
import 'package:travel_connector/features/search/domain/usecase/city_usecase.dart';
import 'package:rxdart/rxdart.dart';

part 'city_event.dart';

part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final CityUseCase _cityUseCase;

  CityBloc(this._cityUseCase) : super(CityInitial()) {
    on<FetchCityEvent>(
      _onFetchCityEvent,
      transformer: _debounceRestartable()
    );
  }

  EventTransformer<FetchCityEvent> _debounceRestartable<FetchCityEvent>() {
    return (events, mapper) {
      return events
          .distinct()
          .debounceTime(const Duration(milliseconds: 500))
          .switchMap(mapper);
    };
  }

  Future<void> _onFetchCityEvent(
      FetchCityEvent event, Emitter<CityState> emit) async {
    if (event.keyword.isEmpty) {
      emit(CityInitial());
      return;
    }
    emit(CityLoading());
    final result = await _cityUseCase(event.keyword);
    result.fold(
      (l) => emit(
        CityError(message: l.message),
      ),
      (r) {
        if (r.isEmpty) {
          emit(CityEmpty());
        } else {
          emit(
            CitySuccess(cities: r),
          );
        }
      },
    );
  }
}

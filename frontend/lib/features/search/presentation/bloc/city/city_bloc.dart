import 'package:bloc/bloc.dart';
import 'package:travel_connector/features/search/domain/entity/city_entity.dart';
import 'package:travel_connector/features/search/domain/usecase/city_usecase.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'city_event.dart';

part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final CityUseCase _cityUseCase;

  CityBloc(this._cityUseCase) : super(CityInitial()) {
    on<FetchCityEvent>(
      _onFetchCityEvent,
      transformer: restartable()
    );
  }

  Future<void> _onFetchCityEvent(
      FetchCityEvent event, Emitter<CityState> emit) async {
    emit(CityLoading());
    await Future.delayed(const Duration(milliseconds: 250));
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
            CitySuccess(city: r),
          );
        }
      },
    );
  }
}

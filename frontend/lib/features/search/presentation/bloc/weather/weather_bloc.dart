import 'package:bloc/bloc.dart';
import 'package:travel_connector/features/search/domain/entity/weather_entity.dart';
import 'package:travel_connector/features/search/domain/usecase/weather_usecase.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherUseCase _weatherUseCase;

  WeatherBloc(this._weatherUseCase) : super(WeatherInitial()) {
    on<FetchWeatherEvent>((event, emit) async {
      emit(WeatherLoading());
      final result = await _weatherUseCase(
        event.latitude,
        event.longitude,
      );
      result.fold(
        (l) => emit(
          WeatherError(message: l.message),
        ),
        (r) => emit(
          WeatherSuccess(weather: r),
        ),
      );
    });
  }
}

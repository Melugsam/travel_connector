import 'package:bloc/bloc.dart';
import 'package:travel_connector/features/search/domain/entity/weather_entity.dart';
import 'package:travel_connector/features/search/domain/usecase/weather_usecase.dart';
import 'package:travel_connector/features/search/domain/utils/weather_util.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherUseCase _weatherUseCase;
  final WeatherUtil _weatherUtil;

  WeatherBloc(this._weatherUseCase, this._weatherUtil)
      : super(WeatherInitial()) {
    on<FetchWeatherEvent>((event, emit) async {
      emit(WeatherLoading());
      final result = await _weatherUseCase(
        event.latitude,
        event.longitude,
      );
      result.fold(
          (failure) => emit(
                WeatherError(message: failure.message),
              ), (weather) {
        final formatedWeather = weather.copyWith(
          weatherDetails: weather.weatherDetails.map(
            (element) {
              return element.copyWith(
                temperature: _weatherUtil.degCelsius(element.temperature),
              );
            },
          ).toList(),
        );
        emit(
          WeatherSuccess(weather: formatedWeather),
        );
      });
    });
  }
}

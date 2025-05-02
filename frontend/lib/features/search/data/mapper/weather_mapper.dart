import 'package:travel_connector/features/search/data/model/weather_response_model.dart';
import 'package:travel_connector/features/search/domain/entity/weather_entity.dart';

class WeatherMapper {
  WeatherEntity mapToEntity(WeatherResponseModel model) {
    return WeatherEntity(
      cityName: model.city.name,
      country: model.city.country,
      weatherDetails: model.list.map(
        (weatherData) {
          return WeatherDetailEntity(
            dateTime: weatherData.dtTxt,
            temperature: weatherData.main.temp,
            description: weatherData.weather.first.description,
            icon: weatherData.weather.first.icon,
            humidity: weatherData.main.humidity,
            pressure: weatherData.main.pressure,
            windSpeed: weatherData.wind.speed,
          );
        },
      ).toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_connector/core/widget/custom_network_image.dart';
import 'package:travel_connector/features/search/domain/entity/weather_entity.dart';

class WeatherContentWidget extends StatelessWidget {
  final WeatherEntity weather;

  const WeatherContentWidget({required this.weather, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        Text(
          weather.cityName,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
        ),
        Text(
          weather.weatherDetails.first.temperature.toString(),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
        ),
        CustomNetworkImage(
          url:
              "https://openweathermap.org/img/wn/${weather.weatherDetails[0].icon}@2x.png",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _DailyWeatherDataWidget(
              icon: Icons.water_drop_outlined,
              text: "${weather.weatherDetails.first.humidity}%",
            ),
            _DailyWeatherDataWidget(
              icon: Icons.thermostat,
              text: "${weather.weatherDetails.first.pressure}Bar",
            ),
            _DailyWeatherDataWidget(
              icon: Icons.air,
              text: "${weather.weatherDetails.first.windSpeed}km/h",
            ),
          ],
        ),
        SizedBox(
          height: 24,
        ),
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: weather.weatherDetails.length - 1,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final dayWeather = weather.weatherDetails[index];
              return _WeatherItemDay(dayWeather: dayWeather);
            },
          ),
        ),
      ],
    );
  }
}

class _DailyWeatherDataWidget extends StatelessWidget {
  final String text;
  final IconData icon;

  const _DailyWeatherDataWidget({
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Color.fromRGBO(47, 89, 225, 1.0),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class _WeatherItemDay extends StatelessWidget {
  final WeatherDetailEntity dayWeather;

  const _WeatherItemDay({required this.dayWeather});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Text(
            formatDateTime(dayWeather.dateTime),
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 3,
          child: CustomNetworkImage(
            url: "https://openweathermap.org/img/wn/${dayWeather.icon}.png",
            height: 50,
            width: 50,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            textAlign: TextAlign.right,
            dayWeather.temperature.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }

  String formatDateTime(String dateTimeStr) {
    final dateTime = DateTime.parse(dateTimeStr);
    return DateFormat('dd.MM.yyyy HH:mm').format(dateTime);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_connector/core/widget/custom_circular_indicator_widget.dart';
import 'package:travel_connector/features/search/presentation/bloc/weather/weather_bloc.dart';

import 'widget/search_data_error_widget.dart';
import 'widget/search_data_info_widget.dart';
import 'widget/weather_content_widget.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return CustomCircularIndicatorWidget();
        }
        if (state is WeatherError) {
          return SearchDataErrorWidget();
        }
        if (state is WeatherSuccess) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 12.0,
              left: 24.0,
              right: 24.0,
            ),
            child: WeatherContentWidget(
              weather: state.weather,
            ),
          );
        }
        return SearchDataInfoWidget(
          hadSent: false,
        );
      },
    );
  }
}

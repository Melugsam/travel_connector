import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_connector/core/widget/custom_circular_indicator_widget.dart';
import 'package:travel_connector/features/search/presentation/bloc/places/places_bloc.dart';

import 'widget/places_item_widget.dart';
import 'widget/search_data_error_widget.dart';
import 'widget/search_data_info_widget.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlacesBloc, PlacesState>(
      builder: (context, state) {
        if (state is PlacesLoading) {
          return CustomCircularIndicatorWidget();
        }
        if (state is PlacesError) {
          return SearchDataErrorWidget();
        }
        if (state is PlacesSuccess) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 12.0,
              left: 24.0,
              right: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (context, index) => PlaceItemWidget(
                place: state.places[index],
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 16,
              ),
              itemCount: state.places.length,
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

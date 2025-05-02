import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_connector/core/widget/custom_circular_indicator_widget.dart';
import 'package:travel_connector/features/search/presentation/bloc/hotel/hotel_bloc.dart';

import 'widget/hotel_item_widget.dart';
import 'widget/search_data_error_widget.dart';
import 'widget/search_data_info_widget.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state is HotelLoading) {
          return CustomCircularIndicatorWidget();
        }
        if (state is HotelError) {
          return SearchDataErrorWidget();
        }
        if (state is HotelSuccess) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 12.0,
              left: 24.0,
              right: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (context, index) => HotelItemWidget(
                hotel: state.hotels[index],
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 16,
              ),
              itemCount: state.hotels.length,
            ),
          );
        }
        if (state is HotelEmpty){
          return SearchDataInfoWidget(
            hadSent: true,
          );
        }
        return SearchDataInfoWidget(
          hadSent: false,
        );
      },
    );
  }
}

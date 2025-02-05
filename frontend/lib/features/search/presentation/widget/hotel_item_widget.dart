import 'package:flutter/material.dart';
import 'package:travel_connector/features/search/domain/entity/hotel_entity.dart';

class HotelItemWidget extends StatelessWidget {
  final HotelEntity hotel;

  const HotelItemWidget({
    required this.hotel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(hotel.title),
      ],
    );
  }
}

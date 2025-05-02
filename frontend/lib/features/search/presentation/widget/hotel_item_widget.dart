import 'package:flutter/material.dart';
import 'package:travel_connector/core/widget/custom_circular_indicator_widget.dart';
import 'package:travel_connector/core/widget/custom_network_image.dart';
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
        SizedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CustomNetworkImage(
              url: hotel.photos.first,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  hotel.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Wrap(
                children: [
                  const Icon(
                    Icons.person,
                    color: Color.fromRGBO(51, 55, 84, 1.0),
                    size: 24,
                  ),
                  Text(hotel.bubbleRating.count,
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
              const SizedBox(
                width: 4,
              ),
              Wrap(
                children: [
                  const Icon(
                    Icons.star,
                    size: 24,
                    color: Colors.yellow,
                  ),
                  Text(
                    hotel.bubbleRating.rating.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

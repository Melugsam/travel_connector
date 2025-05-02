import 'package:flutter/material.dart';
import 'package:travel_connector/core/widget/custom_network_image.dart';
import 'package:travel_connector/features/search/domain/entity/places_entity.dart';

class PlaceItemWidget extends StatelessWidget {
  final PlaceEntity place;

  const PlaceItemWidget({
    required this.place,
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
              url: place.icon,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  place.name,
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
                  Text(place.rating?.toString() ?? '-',
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

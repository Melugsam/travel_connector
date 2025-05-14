import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_connector/core/color/app_colors.dart';
import 'package:travel_connector/core/widget/custom_network_image.dart';
import 'package:travel_connector/features/search/domain/entity/places_entity.dart';
import 'package:travel_connector/features/search/presentation/bloc/place_photo/place_photo_bloc.dart';

class PlaceItemWidget extends StatelessWidget {
  final PlaceEntity place;

  const PlaceItemWidget({
    super.key,
    required this.place,
  });

  void _onTap(BuildContext context) {
    final photoRef = place.icon!;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      builder: (_) {
        return BlocProvider(
            create: (_) => PlacePhotoBloc()..add(
            LoadPlacePhoto(photoRef),
        ),
        child: PlaceBottomSheetContent(place: place),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => _onTap(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
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
                if (place.icon != null)
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.chevron_right_sharp, size: 32),
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
        ),
      ],
    );
  }
}

class PlaceBottomSheetContent extends StatelessWidget {
  final PlaceEntity place;

  const PlaceBottomSheetContent({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
          child: Column(
            children: [
              BlocBuilder<PlacePhotoBloc, PlacePhotoState>(
                builder: (context, state) {
                  if (state is PlacePhotoLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is PlacePhotoSuccess) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.memory(
                        state.imageBytes,
                        width: 300,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    );
                  }
                  return const SizedBox(height: 200); // Placeholder
                },
              ),
              const SizedBox(height: 12),
              Text(
                place.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(66, 70, 97, 1),
                  fontFamily: Theme.of(context).textTheme.bodySmall?.fontFamily,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Wrap(children: [
                    const Icon(
                      Icons.person,
                      color: Color.fromRGBO(51, 55, 84, 1.0),
                      size: 24,
                    ),
                    Text(
                      place.rating?.toString() ?? '-',
                      style: TextStyle(
                        color: const Color.fromRGBO(59, 67, 104, 1),
                        fontFamily:
                            Theme.of(context).textTheme.bodySmall?.fontFamily,
                        fontSize:
                            Theme.of(context).textTheme.bodySmall?.fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
                  const SizedBox(width: 32),
                  Wrap(children: [
                    const Icon(
                      Icons.star,
                      size: 24,
                      color: Colors.yellow,
                    ),
                    Text(
                      place.userRatingsTotal?.toString() ?? '-',
                      style: TextStyle(
                        color: const Color.fromRGBO(59, 67, 104, 1),
                        fontFamily:
                            Theme.of(context).textTheme.bodySmall?.fontFamily,
                        fontSize:
                            Theme.of(context).textTheme.bodySmall?.fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

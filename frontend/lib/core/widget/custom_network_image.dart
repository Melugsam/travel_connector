import 'package:flutter/material.dart';
import 'package:travel_connector/core/color/app_colors.dart';
import 'package:travel_connector/core/widget/custom_circular_indicator_widget.dart';

class CustomNetworkImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxFit? boxFit;

  const CustomNetworkImage({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.boxFit,
  });

  @override
  Widget build(BuildContext context) {
    try {
      return Image.network(
        url,
        width: width,
        height: height,
        fit: boxFit ?? BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return const Center(
            child: CustomCircularIndicatorWidget(),
          );
        },
      );
    } catch (error) {
      return ColoredBox(
        color: AppColors.lightGrey,
      );
    }
  }
}

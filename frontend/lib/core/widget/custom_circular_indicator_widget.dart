import 'package:flutter/material.dart';
import 'package:travel_connector/core/color/app_colors.dart';

class CustomCircularIndicatorWidget extends StatelessWidget {
  const CustomCircularIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travel_connector/core/color/app_colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool border;
  final ValueChanged? onChanged;

  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.border = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: AppColors.darkGrey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: border? BorderSide(
            color: AppColors.lightGrey ,
            width: 1.0,
          ) : BorderSide.none,
        ),
        focusedBorder: border? OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.lightGrey,
            width: 1.0,
          ),
        ) : null,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
      ),
    );
  }
}

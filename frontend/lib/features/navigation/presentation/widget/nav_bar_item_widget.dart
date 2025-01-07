import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:travel_connector/core/color/app_colors.dart';

class NavbarItemWidget extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String label;
  final IconData iconData;

  const NavbarItemWidget({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.label,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Icon(
                iconData,
                color: isSelected ? AppColors.primary : AppColors.black,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            AutoSizeText(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                height: 1,
                color: isSelected ? AppColors.primary : AppColors.black,
              ),
              softWrap: true,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}

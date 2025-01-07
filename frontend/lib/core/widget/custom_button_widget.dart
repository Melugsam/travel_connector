import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool outline;
  final double? height;
  final double? width;
  final IconData? icon;
  final String? svgPath;

  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.outline = false,
    this.height,
    this.width,
    this.icon,
    this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: height ?? 40,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: outline ? Colors.transparent : theme.primaryColor,
          side: outline
              ? BorderSide(color: theme.primaryColor, width: 2)
              : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                color:
                    outline ? theme.primaryColor : Colors.white,
                size: 20,
              ),
            if (svgPath != null)
              SvgPicture.asset(
                svgPath!,
                height: 20,
                width: 20,
              ),
            if (icon != null || svgPath != null)
              const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color:
                    outline ? theme.primaryColor : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

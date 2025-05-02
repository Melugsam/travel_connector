import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travel_connector/core/color/app_colors.dart';
import 'package:travel_connector/core/constant/url.dart';

class CustomDefaultAvatarWidget extends StatelessWidget {
  final String? avatarUrl;
  final String? avatarPath;
  final double? radius;

  const CustomDefaultAvatarWidget({
    super.key,
    this.avatarUrl,
    this.avatarPath,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey[300],
      backgroundImage: avatarPath != null
          ? FileImage(File(avatarPath!))
          : avatarUrl != null
          ? CachedNetworkImageProvider(serviceUrl + avatarUrl!)
          : null,
      child: avatarPath == null && avatarUrl == null
          ? Icon(
        Icons.person,
        size: radius,
        color: AppColors.lightGrey,
      )
          : null,
    );
  }

}

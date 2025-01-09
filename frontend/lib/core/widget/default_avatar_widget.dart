import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travel_connector/core/color/app_colors.dart';

class DefaultAvatarWidget extends StatelessWidget {
  final String? avatarUrl;
  const DefaultAvatarWidget({super.key, this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey[300],
      backgroundImage: avatarUrl != null
          ? CachedNetworkImageProvider(avatarUrl!)
          : null,
      child: avatarUrl == null
          ? Icon(
        Icons.person,
        color: AppColors.lightGrey,
      )
          : null,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travel_connector/core/widget/custom_button_widget.dart';
import 'package:travel_connector/core/widget/custom_default_avatar_widget.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String name;
  final String? avatarUrl;
  final String description;
  final bool isFollowing;
  final bool isCurrentUser;
  final int followersCount;
  final VoidCallback onFollowPressed;

  const ProfileHeaderWidget({
    super.key,
    required this.name,
    this.avatarUrl,
    required this.description,
    required this.isFollowing,
    required this.followersCount,
    required this.isCurrentUser,
    required this.onFollowPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomDefaultAvatarWidget(
            avatarUrl: avatarUrl,
            radius: 40,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          description.isNotEmpty
              ? Column(
                  children: [
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                )
              : SizedBox(
                  height: 8,
                ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isCurrentUser)
                  Expanded(
                    child: CustomButtonWidget(
                      text: isFollowing ? "Подписаться" : "Отписаться",
                      onPressed: () {},
                      outline: isFollowing,
                    ),
                  ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.group),
                      const SizedBox(width: 8),
                      Text(
                          "$followersCount ${getPluralForm(followersCount, 'Подписчик', 'Подписчика', 'Подписчиков')}"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getPluralForm(int count, String one, String few, String many) {
    if (count % 10 == 1 && count % 100 != 11) {
      return one;
    } else if (count % 10 >= 2 &&
        count % 10 <= 4 &&
        (count % 100 < 10 || count % 100 >= 20)) {
      return few;
    } else {
      return many;
    }
  }
}

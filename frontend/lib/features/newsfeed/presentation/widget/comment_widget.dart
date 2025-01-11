import 'package:flutter/material.dart';
import 'package:travel_connector/core/color/app_colors.dart';
import 'package:travel_connector/core/widget/custom_default_avatar_widget.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';
import 'package:intl/intl.dart';

class CommentWidget extends StatelessWidget {
  final PostCommentEntity comment;

  const CommentWidget({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ListTile(
        leading: CustomDefaultAvatarWidget(
          avatarUrl: comment.user.avatar,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  comment.user.name,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                    color: AppColors.black,
                      ),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(comment.content),
              ],
            ),
            SizedBox(height: 4),
            Text(
              _formatDate(comment.createdAt),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.lightGrey,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String createdAt) {
    final dateTime = DateTime.parse(createdAt);
    final formatter = DateFormat('MMM d, yyyy HH:mm');
    return formatter.format(dateTime);
  }
}

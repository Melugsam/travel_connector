import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travel_connector/core/color/app_colors.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';
import 'package:intl/intl.dart';

class PostWidget extends StatelessWidget {
  final PostEntity post;

  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    // final bool liked = post.likedBy.contains(my id)
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          _buildDescription(context),
          if (post.images.isNotEmpty) _buildImages(context),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        backgroundImage: post.user.avatar != null
            ? CachedNetworkImageProvider(post.user.avatar!)
            : null,
        child: post.user.avatar == null
            ? const Icon(
                Icons.person,
                color: AppColors.lightGrey,
              )
            : null,
      ),
      title: Text(
        post.user.name,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
      ),
      subtitle: Text(
        _formatDate(post.createdAt),
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColors.darkGrey,
            ),
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      post.description,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.black,
          ),
    );
  }

  Widget _buildImages(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: post.images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: post.images[index],
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 16,
          children: [
            ActionButtonWidget(
              onTap: () {

              },
              iconData: Icons.thumb_up_alt_outlined,
              text: '${post.likesCount}',
            ),
            ActionButtonWidget(
              onTap: () {},
              iconData: Icons.comment_outlined,
              text: '${post.commentsCount}',
            ),
          ],
        ),
        ActionButtonWidget(
          onTap: () {},
          iconData: Icons.share,
        ),
      ],
    );
  }

  String _formatDate(String createdAt) {
    final dateTime = DateTime.parse(createdAt);
    final formatter = DateFormat('MMM d, yyyy');
    return formatter.format(dateTime);
  }
}

class ActionButtonWidget extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;
  final String? text;

  const ActionButtonWidget({
    super.key,
    required this.iconData,
    this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        child: Row(
          spacing: 8,
          children: [
            Icon(iconData),
            if (text != null)
              Text(
                text!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.black,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}

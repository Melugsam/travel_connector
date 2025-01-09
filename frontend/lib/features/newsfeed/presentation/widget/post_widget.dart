import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_connector/core/color/app_colors.dart';
import 'package:travel_connector/core/widget/default_avatar_widget.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';
import 'package:intl/intl.dart';
import 'package:travel_connector/features/newsfeed/presentation/bloc/post/post_bloc.dart';
import 'package:travel_connector/features/newsfeed/presentation/bloc/post_write_comment/post_write_comment_bloc.dart';
import 'package:travel_connector/features/newsfeed/presentation/bloc/post_like/post_like_bloc.dart';

class PostWidget extends StatelessWidget {
  final PostEntity post;
  final PostLikeBloc? postLikeBloc;
  final PostWriteCommentBloc? postWriteCommentBloc;

  const PostWidget({
    super.key,
    required this.post,
    required this.postLikeBloc,
    required this.postWriteCommentBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          _buildDescription(context),
          if (post.images.isNotEmpty) _buildImages(context),
          postLikeBloc != null && postWriteCommentBloc != null
              ? _buildFooter(context)
              : SizedBox(
                  height: 4,
                ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return ListTile(
      leading: DefaultAvatarWidget(
        avatarUrl: post.user.avatar,
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
              color: AppColors.lightGrey,
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
            LikeButtonWidget(
              onTap: () {
                postLikeBloc!.add(ExecuteLikeEvent(postId: post.id));
              },
              iconData: Icons.thumb_up_alt_outlined,
              initialCount: post.likesCount,
              liked: post.liked,
            ),
            ActionButtonWidget(
              onTap: () {
                context.pushNamed('comments', extra: {
                  'post': post,
                  'postWriteCommentBloc': postWriteCommentBloc,
                }).then(
                  (value) {
                    if (context.mounted) {
                      context.read<PostBloc>().add(FetchPostEvent());
                    }
                  },
                );
              },
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
            Icon(
              iconData,
              color: AppColors.black,
            ),
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

class LikeButtonWidget extends StatefulWidget {
  final IconData iconData;
  final int initialCount;
  final bool liked;
  final GestureTapCallback? onTap;

  const LikeButtonWidget({
    super.key,
    required this.iconData,
    required this.liked,
    this.initialCount = 0,
    this.onTap,
  });

  @override
  State<LikeButtonWidget> createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {
  late int count;
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
    isLiked = widget.liked;
  }

  void _toggleLike() {
    setState(() {
      if (isLiked) {
        count--;
      } else {
        count++;
      }
      isLiked = !isLiked;
    });

    if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleLike,
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              widget.iconData,
              color: isLiked ? Theme.of(context).primaryColor : Colors.black,
            ),
            SizedBox(width: 8),
            Text(
              count.toString(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color:
                        isLiked ? Theme.of(context).primaryColor : Colors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

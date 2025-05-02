import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:travel_connector/core/color/app_colors.dart';
import 'package:travel_connector/core/router/routes.dart';
import 'package:travel_connector/core/widget/custom_default_avatar_widget.dart';
import 'package:travel_connector/features/app/presentation/bloc/notification/notification_cubit.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_response_model.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';
import 'package:travel_connector/features/newsfeed/presentation/bloc/post/post_bloc.dart';
import 'package:travel_connector/features/newsfeed/presentation/bloc/post_like/post_like_bloc.dart';

class PostWidget extends StatefulWidget {
  final PostEntity post;
  final bool showDetails;

  const PostWidget({
    super.key,
    required this.post,
    required this.showDetails,
  });

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> with TickerProviderStateMixin {
  final List<bool> _imageLoadStates = [];
  bool _checkedAll = false;

  @override
  void initState() {
    super.initState();

    if (widget.post.images.isNotEmpty) {
      _imageLoadStates.addAll(List.filled(widget.post.images.length, false));
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => _preloadImages());
  }

  void _preloadImages() {
    if (widget.post.images.isEmpty) return;

    for (int i = 0; i < widget.post.images.length; i++) {
      final image = Image.network(widget.post.images[i]);
      final imageStream = image.image.resolve(const ImageConfiguration());
      imageStream.addListener(
        ImageStreamListener(
              (ImageInfo info, bool _) => _markLoaded(i, success: true),
          onError: (_, __) => _markLoaded(i, success: false),
        ),
      );
    }
  }

  void _markLoaded(int index, {required bool success}) {
    if (!mounted) return;
    setState(() {
      _imageLoadStates[index] = success;
      if (_imageLoadStates.where((e) => e != false).length + _imageLoadStates.where((e) => !e).length ==
          _imageLoadStates.length) {
        _checkedAll = true;
      }
    });
  }

  List<String> get _successfulImages {
    return widget.post.images
        .asMap()
        .entries
        .where((entry) => _imageLoadStates.length > entry.key && _imageLoadStates[entry.key])
        .map((e) => e.value)
        .toList();
  }

  Widget _buildHeader(BuildContext context) => ListTile(
    onTap: () {
      context.pushNamed(
        'profile',
        extra: widget.post.user.id,
      );
    },
    leading: CustomDefaultAvatarWidget(avatarUrl: widget.post.user.avatar),
    title: Text(
      widget.post.user.name,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
    ),
    subtitle: Text(
      _formatDate(widget.post.createdAt),
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
        color: AppColors.lightGrey,
      ),
    ),
  );

  Widget _buildTitle(BuildContext context) {
    return Text(
      widget.post.title!,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }


  Widget _buildDescription(BuildContext context) => Text(
    widget.post.description,
    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: AppColors.black,
    ),
  );

  Widget _buildRouteButton(BuildContext context) {
    if (widget.post.route == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: InkWell(
        onTap: () {
          final model = MapRouteModel(
            markers: widget.post.route!.markers.map((m) => MarkerModel(
              point: LatLngModel(
                latitude: m.latitude,
                longitude: m.longitude,
              ),
              type: m.type,
              label: m.label,
            )).toList(),
            routes: widget.post.route!.routes.map((r) => RouteConnectionModel(
              fromIndex: r.fromIndex,
              toIndex: r.toIndex,
            )).toList(),
          );

          context.pushNamed(
            'addMap',
            extra: MapRouteArguments(
              route: model,
              isViewMode: true,
            ),
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.map_outlined, color: AppColors.secondary),
            const SizedBox(width: 8),
            Text(
              'Посмотреть маршрут',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildImages() {
    final images = _successfulImages;

    if (images.isEmpty) return const SizedBox.shrink();

    if (images.length == 1) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: CachedNetworkImage(
            imageUrl: images.first,
            fit: BoxFit.cover,
            errorWidget: (_, __, ___) => const SizedBox.shrink(),
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: images.length,
      padding: const EdgeInsets.symmetric(vertical: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return CachedNetworkImage(
          imageUrl: images[index],
          fit: BoxFit.cover,
          errorWidget: (_, __, ___) => const SizedBox.shrink(),
        );
      },
    );
  }


  Widget _buildFooter(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          LikeButtonWidget(
            onTap: () {
              context.read<PostLikeBloc>().add(ExecuteLikeEvent(postId: widget.post.id));
            },
            iconData: Icons.thumb_up_alt_outlined,
            initialCount: widget.post.likesCount,
            liked: widget.post.liked,
          ),
          const SizedBox(width: 16),
          ActionButtonWidget(
            onTap: () {
              context.pushNamed('comments', extra: widget.post).then((_) {
                if (context.mounted) {
                  context.read<PostBloc>().add(FetchPostEvent());
                }
              });
            },
            iconData: Icons.comment_outlined,
            text: '${widget.post.commentsCount}',
          ),
        ],
      ),
      ActionButtonWidget(
        onTap: () async {
          final buffer = StringBuffer();

          buffer.writeln('${widget.post.user.name} поделился постом:');
          buffer.writeln();

          if (widget.post.title != null && widget.post.title!.isNotEmpty) {
            buffer.writeln('📌 ${widget.post.title}');
            buffer.writeln();
          }

          buffer.writeln(widget.post.description);
          buffer.writeln();

          buffer.writeln('🗓 Опубликовано: ${_formatDate(widget.post.createdAt)}');
          buffer.writeln('👍 ${widget.post.likesCount} лайков');
          buffer.writeln('💬 ${widget.post.commentsCount} комментариев');

          if (widget.post.route != null) {
            buffer.writeln();
            buffer.writeln('🗺 В этом посте есть маршрут, посмотри в приложении!');
          }

          try {
            await Share.share(buffer.toString());
          } catch (e) {
            if (context.mounted) {
              context.read<NotificationCubit>().showError(
                message: 'Не удалось поделиться, попробуйте позднее',
              );
            }
          }
        },

        iconData: Icons.share,
      ),
    ],
  );

  String _formatDate(String createdAt) {
    final dateTime = DateTime.parse(createdAt);
    final formatter = DateFormat('MMM d, yyyy');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          if (widget.post.title != null && widget.post.title!.isNotEmpty) ...[
            const SizedBox(height: 8),
            _buildTitle(context),
          ],
          const SizedBox(height: 8),
          _buildDescription(context),
          if (widget.post.route != null) _buildRouteButton(context),
          _buildImages(),
          if (widget.showDetails) ...[
            const SizedBox(height: 8),
            _buildFooter(context),
          ],
        ],
      ),
    );
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
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Icon(iconData, color: AppColors.black),
            if (text != null)
              const SizedBox(width: 8),
            if (text != null)
              Text(
                text!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.black),
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

    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleLike,
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Icon(
              widget.iconData,
              color: isLiked ? Theme.of(context).primaryColor : AppColors.black,
            ),
            const SizedBox(width: 8),
            Text(
              count.toString(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: isLiked ? Theme.of(context).primaryColor : AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_connector/core/injector/di.dart';
import 'package:travel_connector/core/widget/custom_button_widget.dart';
import 'package:travel_connector/core/widget/custom_circular_indicator_widget.dart';
import 'package:travel_connector/core/widget/custom_data_receive_error_widget.dart';
import 'package:travel_connector/core/widget/custom_default_avatar_widget.dart';
import 'package:travel_connector/features/newsfeed/presentation/widget/post_widget.dart';
import 'package:travel_connector/features/profile/presentation/bloc/profile/profile_bloc.dart';

import 'bloc/follow/follow_bloc.dart';

class OtherProfileScreen extends StatelessWidget {
  final int userId;

  const OtherProfileScreen({required this.userId, super.key});

  @override
  Widget build(BuildContext context) {
    final scroll = ScrollController();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          ProfileBloc(getIt())
            ..add(FetchProfileEvent(targetUserId: userId)),
        ),
        BlocProvider(
          create: (_) => FollowBloc(getIt()),
        ),
      ],
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context
                  .read<ProfileBloc>()
                  .add(FetchProfileEvent(targetUserId: userId));
            },
            child: Scaffold(
              appBar: AppBar(title: const Text("Профиль пользователя")),
              body: _buildBody(context, state, scroll),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, ProfileState state,
      ScrollController scroll) {
    if (state is ProfileLoading) {
      return const CustomCircularIndicatorWidget();
    }
    if (state is ProfileError) {
      return CustomDataReceiveErrorWidget(
        onTap: () =>
            context
                .read<ProfileBloc>()
                .add(FetchProfileEvent(targetUserId: userId)),
      );
    }
    if (state is! ProfileSuccess) return const SizedBox.shrink();

    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      controller: scroll,
      slivers: [
        SliverToBoxAdapter(
          child: OtherProfileHeaderWidget(
            name: state.profile.name,
            description: state.profile.description,
            avatarUrl: state.profile.avatar,
            isFollowing: state.profile.isFollowing,
            followersCount: state.profile.followers.length,
            onFollowPressed: () {
              context.read<FollowBloc>().add(FollowToggleEvent(userId));
            },
          ),
        ),
        const SliverToBoxAdapter(child: Divider(thickness: 4)),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Center(
                child: Text("Посты пользователя",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          ),
        ),
        SliverList.separated(
          itemCount: state.profile.posts.length,
          itemBuilder: (context, index) =>
              PostWidget(
                post: state.profile.posts[index],
                showDetails: true,
              ),
          separatorBuilder: (_, __) => const SizedBox(height: 4),
        )
      ],
    );
  }
}
class OtherProfileHeaderWidget extends StatefulWidget {
  final String name;
  final String description;
  final String? avatarUrl;
  final bool isFollowing;
  final int followersCount;
  final VoidCallback onFollowPressed;

  const OtherProfileHeaderWidget({
    required this.name,
    required this.description,
    required this.avatarUrl,
    required this.isFollowing,
    required this.followersCount,
    required this.onFollowPressed,
    super.key,
  });

  @override
  State<OtherProfileHeaderWidget> createState() => _OtherProfileHeaderWidgetState();
}

class _OtherProfileHeaderWidgetState extends State<OtherProfileHeaderWidget> {
  late bool _isFollowing;

  @override
  void initState() {
    super.initState();
    _isFollowing = widget.isFollowing;
  }

  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;
    });
    widget.onFollowPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        CustomDefaultAvatarWidget(
          avatarUrl: widget.avatarUrl,
          radius: 40,
        ),
        const SizedBox(height: 16),
        Text(
          widget.name,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        if (widget.description.isNotEmpty) ...[
          Text(
            widget.description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
        ] else
          const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Row(
            children: [
              Expanded(
                child: CustomButtonWidget(
                  text: _isFollowing ? "Отписаться" : "Подписаться",
                  onPressed: _toggleFollow,
                  outline: _isFollowing,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.group),
                    const SizedBox(width: 8),
                    Text(
                      "${widget.followersCount} ${getPluralForm(widget.followersCount)}",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  String getPluralForm(int count) {
    if (count % 10 == 1 && count % 100 != 11) return 'Подписчик';
    if (count % 10 >= 2 && count % 10 <= 4 && (count % 100 < 10 || count % 100 >= 20)) {
      return 'Подписчика';
    }
    return 'Подписчиков';
  }
}

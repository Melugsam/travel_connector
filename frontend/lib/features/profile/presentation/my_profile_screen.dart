import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_connector/core/injector/di.dart';
import 'package:travel_connector/core/manager/token_manager.dart';
import 'package:travel_connector/core/widget/custom_circular_indicator_widget.dart';
import 'package:travel_connector/core/widget/custom_data_receive_error_widget.dart';
import 'package:travel_connector/core/widget/custom_default_avatar_widget.dart';
import 'package:travel_connector/features/newsfeed/presentation/widget/post_widget.dart';
import 'package:travel_connector/features/profile/presentation/bloc/profile/profile_bloc.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scroll = ScrollController();
    return BlocProvider(
      create: (context) => ProfileBloc(getIt())..add(FetchProfileEvent(targetUserId: null)),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<ProfileBloc>().add(FetchProfileEvent(targetUserId: null));
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Мой профиль"),
                actions: [
                  if (state is ProfileSuccess) ...[
                    IconButton(
                      icon: const Icon(Icons.logout),
                      onPressed: () async {
                        await getIt<TokenManager>().clearAccessToken();
                        if (context.mounted) context.goNamed('login');
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        context.pushNamed(
                          'edit',
                          extra: {
                            'currentName': state.profile.name,
                            'currentProfileDescription': state.profile.description,
                            'currentAvatarUrl': state.profile.avatar,
                          },
                        ).then((_) {
                          if (context.mounted) {
                            context.read<ProfileBloc>().add(FetchProfileEvent(targetUserId: null));
                          }
                        });
                      },
                    ),
                  ],
                ],
              ),
              body: _buildBody(context, state, scroll),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, ProfileState state, ScrollController scroll) {
    if (state is ProfileLoading) {
      return const CustomCircularIndicatorWidget();
    }
    if (state is ProfileError) {
      return CustomDataReceiveErrorWidget(
        onTap: () => context.read<ProfileBloc>().add(FetchProfileEvent(targetUserId: null)),
      );
    }
    if (state is! ProfileSuccess) return const SizedBox.shrink();

    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      controller: scroll,
      slivers: [
        SliverToBoxAdapter(
          child: MyProfileHeaderWidget(
            name: state.profile.name,
            description: state.profile.description,
            avatarUrl: state.profile.avatar,
            onEditPressed: () {
              context.pushNamed(
                'edit',
                extra: {
                  'currentName': state.profile.name,
                  'currentProfileDescription': state.profile.description,
                  'currentAvatarUrl': state.profile.avatar,
                },
              ).then((_) {
                if (context.mounted) {
                  context.read<ProfileBloc>().add(FetchProfileEvent(targetUserId: null));
                }
              });
            },
            onLogoutPressed: () async {
              await getIt<TokenManager>().clearAccessToken();
              if (context.mounted) context.goNamed('login');
            },
          ),
        ),

        const SliverToBoxAdapter(child: Divider(thickness: 4)),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Center(child: Text("Мои посты", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          ),
        ),
        SliverList.separated(
          itemCount: state.profile.posts.length,
          itemBuilder: (context, index) => PostWidget(
            post: state.profile.posts[index],
            showDetails: true,
          ),
          separatorBuilder: (_, __) => const SizedBox(height: 4),
        )
      ],
    );
  }
}

class MyProfileHeaderWidget extends StatelessWidget {
  final String name;
  final String description;
  final String? avatarUrl;
  final VoidCallback onEditPressed;
  final VoidCallback onLogoutPressed;

  const MyProfileHeaderWidget({
    required this.name,
    required this.description,
    required this.avatarUrl,
    required this.onEditPressed,
    required this.onLogoutPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
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
      ],
    );
  }
}


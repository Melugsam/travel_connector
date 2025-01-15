import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_connector/core/injector/di.dart';
import 'package:travel_connector/core/widget/custom_circular_indicator_widget.dart';
import 'package:travel_connector/core/widget/custom_data_receive_error_widget.dart';
import 'package:travel_connector/features/newsfeed/presentation/bloc/post/post_bloc.dart';
import 'package:travel_connector/features/newsfeed/presentation/widget/post_widget.dart';
import 'package:travel_connector/features/profile/presentation/widget/profile_header_widget.dart';

import 'bloc/profile/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  final int? targetUserId;

  const ProfileScreen({super.key, this.targetUserId});

  @override
  Widget build(BuildContext context) {
    final ScrollController scroll = ScrollController();
    return BlocProvider(
      create: (context) => ProfileBloc(
        getIt(),
        getIt(),
      )..add(
          FetchProfileEvent(targetUserId: targetUserId),
        ),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, profileState) {
          context.read<PostBloc>().add(
                FetchPostEvent(targetUserId: targetUserId),
              );
          return RefreshIndicator(
            onRefresh: () async {
              context.read<ProfileBloc>().add(
                    FetchProfileEvent(targetUserId: targetUserId),
                  );
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Профиль"),
                actions: [
                  if (profileState is ProfileSuccess &&
                      profileState.profile.isCurrentUser)
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        context.pushNamed(
                          'edit',
                          extra: {
                            'currentName': profileState.profile.name,
                            'currentProfileDescription':
                                profileState.profile.description,
                            'currentAvatarUrl': profileState.profile.avatar,
                          },
                        ).then(
                          (value) {
                            if (context.mounted) {
                              context.read<ProfileBloc>().add(
                                    FetchProfileEvent(
                                      targetUserId: targetUserId,
                                    ),
                                  );
                            }
                          },
                        );
                      },
                    ),
                ],
              ),
              body: CustomScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                controller: scroll,
                slivers: [
                  Builder(
                    builder: (context) {
                      if (profileState is ProfileLoading) {
                        return SliverFillRemaining(
                          child: CustomCircularIndicatorWidget(),
                        );
                      }
                      if (profileState is ProfileSuccess) {
                        return SliverMainAxisGroup(
                          slivers: [
                            SliverToBoxAdapter(
                              child: ProfileHeaderWidget(
                                name: profileState.profile.name,
                                description: profileState.profile.description,
                                avatarUrl: profileState.profile.avatar,
                                isFollowing:
                                    profileState.profile.currentUserFollowing,
                                isCurrentUser:
                                    profileState.profile.isCurrentUser,
                                followersCount:
                                    profileState.profile.followers.length,
                                onFollowPressed: () {},
                              ),
                            ),
                            SliverToBoxAdapter(
                                child: const Divider(thickness: 4)),
                            SliverToBoxAdapter(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      right: 16,
                                      bottom: 16,
                                      top: 8,
                                    ),
                                    child: const Text(
                                      "Недавние посты автора",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            BlocBuilder<PostBloc, PostState>(
                              builder: (context, postState) {
                                if (postState is PostSuccess) {
                                  return SliverList.separated(
                                    itemCount: postState.posts.length,
                                    itemBuilder: (context, index) {
                                      return PostWidget(
                                        post: postState.posts[index],
                                        showDetails: true,
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      height: 4,
                                    ),
                                  );
                                }
                                if (postState is PostLoading) {
                                  return SliverFillRemaining(
                                    child: CustomCircularIndicatorWidget(),
                                  );
                                }
                                return SliverToBoxAdapter(
                                  child: CustomDataReceiveErrorWidget(
                                    onTap: () {
                                      context.read<PostBloc>().add(
                                            FetchPostEvent(
                                              targetUserId: targetUserId,
                                            ),
                                          );
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      }
                      if (profileState is ProfileError) {
                        return SliverFillRemaining(
                          child: CustomDataReceiveErrorWidget(
                            onTap: () => context.read<ProfileBloc>().add(
                                  FetchProfileEvent(targetUserId: targetUserId),
                                ),
                          ),
                        );
                      }
                      return SliverFillRemaining(
                        child: SizedBox.shrink(),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

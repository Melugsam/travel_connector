import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_connector/core/injector/di.dart';
import 'package:travel_connector/core/widget/custom_circular_indicator_widget.dart';
import 'package:travel_connector/core/widget/custom_data_receive_error_widget.dart';
import 'package:travel_connector/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:travel_connector/features/profile/presentation/widget/profile_header_widget.dart';

class ProfileScreen extends StatelessWidget {
  final int? userId;

  const ProfileScreen({required this.userId, super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scroll = ScrollController();
    return BlocProvider(
      create: (context) => ProfileBloc(
        getIt(),
      )..add(
          FetchProfileEvent(targetUserId: userId),
        ),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, profileState) {
          return RefreshIndicator(
            onRefresh: () async {},
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Профиль"),
                actions: [
                  if (profileState is ProfileSuccess)
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
                                    FetchProfileEvent(targetUserId: userId),
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
                                isFollowing: profileState.profile.isFollowing,
                                isCurrentUser:
                                    profileState.profile.isCurrentUser,
                                followersCount:
                                    profileState.profile.followers.length,
                                onFollowPressed: () {},
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: const Divider(thickness: 4),
                            ),
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
                            // SliverList.separated(
                            //   itemCount: profileState.profile.posts.length,
                            //   itemBuilder: (context, index) {
                            //     return PostWidget(
                            //       post: profileState.profile.posts[index],
                            //       showDetails: true,
                            //     );
                            //   },
                            //   separatorBuilder: (context, index) => SizedBox(
                            //     height: 4,
                            //   ),
                            // )
                          ],
                        );
                      }
                      if (profileState is ProfileError) {
                        return SliverFillRemaining(
                          child: CustomDataReceiveErrorWidget(
                            onTap: () => context.read<ProfileBloc>().add(
                                  FetchProfileEvent(targetUserId: userId),
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

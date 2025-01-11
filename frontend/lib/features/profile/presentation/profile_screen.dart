import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_connector/core/injector/di.dart';
import 'package:travel_connector/core/widget/custom_circular_indicator_widget.dart';
import 'package:travel_connector/core/widget/custom_data_receive_error_widget.dart';
import 'package:travel_connector/features/profile/presentation/widget/profile_header_widget.dart';

import 'bloc/profile/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(
        getIt(),
        getIt(),
      )..add(
          FetchProfileEvent(targetUserId: null),
        ),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, profileState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Профиль"),
              actions: [
                if (profileState is ProfileSuccess && profileState.profile.isCurrentUser)
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      context.pushNamed(
                        'edit',
                        extra: {
                          'currentName': profileState.profile.name,
                          'currentProfileDescription':
                              profileState.profile.name,
                          'currentAvatarUrl': profileState.profile.avatar,
                        },
                      );
                    },
                  ),
              ],
            ),
            body: Builder(
              builder: (context) {
                if (profileState is ProfileLoading) {
                  return CustomCircularIndicatorWidget();
                }
                if (profileState is ProfileSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileHeaderWidget(
                        name: profileState.profile.name,
                        bio: profileState.profile.name,
                        avatarUrl: profileState.profile.avatar,
                        isFollowing: profileState.profile.currentUserFollowing,
                        isCurrentUser: profileState.profile.isCurrentUser,
                        followersCount: profileState.profile.followers.length,
                        onFollowPressed: () {},
                      ),
                      const Divider(thickness: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: const Text(
                              "Недавние посты автора",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
                return CustomDataReceiveErrorWidget(
                  onTap: () => context.read<ProfileBloc>().add(
                        FetchProfileEvent(targetUserId: null),
                      ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

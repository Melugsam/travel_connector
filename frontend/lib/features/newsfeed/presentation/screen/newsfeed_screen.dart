import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_connector/core/injector/di.dart';
import 'package:travel_connector/core/widget/custom_circular_indicator_widget.dart';
import 'package:travel_connector/core/widget/custom_data_receive_error_widget.dart';
import 'package:travel_connector/features/app/presentation/bloc/notification/notification_cubit.dart';
import 'package:travel_connector/features/newsfeed/presentation/bloc/post/post_bloc.dart';

import '../bloc/post_like/post_like_bloc.dart';
import '../widget/post_widget.dart';

class NewsfeedScreen extends StatefulWidget {
  const NewsfeedScreen({super.key});

  @override
  State<NewsfeedScreen> createState() => _NewsfeedScreenState();
}
class _NewsfeedScreenState extends State<NewsfeedScreen> {
  late final PostBloc _postBloc;

  @override
  void initState() {
    super.initState();
    _postBloc = PostBloc(getIt());
    _postBloc.add(FetchPostEvent());
  }

  @override
  void dispose() {
    _postBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _postBloc,
      child: BlocListener<PostLikeBloc, PostLikeState>(
        listener: (context, state) {
          if (state is PostLikeError) {
            context.read<NotificationCubit>().showError(
                message: 'Не удалось поставить реакцию. Повторите позднее');
          }
        },
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, postState) {
            return RefreshIndicator(
              onRefresh: () async {
                _postBloc.add(FetchPostEvent());
              },
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('Лента новостей'),
                ),
                floatingActionButton: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () async {
                    final result = await context.pushNamed('addPost');
                    if (result == true) {
                      _postBloc.add(FetchPostEvent());
                    }
                  },
                ),
                body: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: CustomScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      Builder(
                        builder: (context) {
                          if (postState is PostLoading) {
                            return const SliverFillRemaining(
                              child: CustomCircularIndicatorWidget(),
                            );
                          }
                          if (postState is PostEmpty) {
                            return SliverFillRemaining(
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Center(
                                  child: Text(
                                    "Посты отсутствуют\nСоздайте пост, используя кнопку в правом нижнем углу экрана",
                                    style:
                                    Theme.of(context).textTheme.bodyLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            );
                          }
                          if (postState is PostSuccess) {
                            return SliverToBoxAdapter(
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return PostWidget(
                                    post: postState.posts[index],
                                    showDetails: true,
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                const Divider(thickness: 4, height: 16),
                                itemCount: postState.posts.length,
                              ),
                            );
                          }
                          return SliverFillRemaining(
                            child: CustomDataReceiveErrorWidget(
                              onTap: () =>
                                  _postBloc.add(FetchPostEvent()),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

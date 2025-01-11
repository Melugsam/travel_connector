import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_connector/core/injector/di.dart';
import 'package:travel_connector/core/color/app_colors.dart';
import 'package:travel_connector/core/manager/notification_manager.dart';
import 'package:travel_connector/core/widget/custom_circular_indicator_widget.dart';
import 'package:travel_connector/core/widget/custom_data_receive_error_widget.dart';
import 'package:travel_connector/features/newsfeed/presentation/bloc/post/post_bloc.dart';
import 'package:travel_connector/features/newsfeed/presentation/bloc/post_write_comment/post_write_comment_bloc.dart';

import 'bloc/post_like/post_like_bloc.dart';
import 'widget/post_widget.dart';

class NewsfeedScreen extends StatelessWidget {
  const NewsfeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostBloc(
            getIt(),
            getIt(),
          )..add(
              FetchPostEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => PostLikeBloc(
            getIt(),
            getIt(),
          ),
        ),
        BlocProvider(
          create: (context) => PostWriteCommentBloc(
            getIt(),
            getIt(),
          ),
        ),
      ],
      child: BlocListener<PostLikeBloc, PostLikeState>(
        listener: (context, state) {
          if (state is PostLikeError) {
            getIt<NotificationManager>().showError(
                message: 'Не удалось поставить реакцию. Повторите позднее');
          }
        },
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, postState) {
            return RefreshIndicator(
              backgroundColor: AppColors.white,
              color: AppColors.primary,
              onRefresh: () async {
                context.read<PostBloc>().add(FetchPostEvent());
              },
              child: Scaffold(
                appBar: AppBar(
                  title: Text('Лента новостей'),
                ),
                floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {},
                ),
                body: Padding(
                  padding: EdgeInsets.only(
                    bottom: 12,
                  ),
                  child: CustomScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    slivers: [
                      Builder(
                        builder: (context) {
                          if (postState is PostLoading) {
                            return SliverFillRemaining(
                              child: CustomCircularIndicatorWidget(),
                            );
                          }
                          if (postState is PostEmpty) {
                            return SliverFillRemaining(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Center(
                                  child: Text(
                                    "Посты отсутствуют\nСоздайте пост используя кнопку в правом нижнем углу экрана",
                                    style: Theme.of(context).textTheme.bodyLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            );
                          }
                          if (postState is PostSuccess) {
                            final postLikeBloc = context.read<PostLikeBloc>();
                            final postWriteCommentBloc =
                                context.read<PostWriteCommentBloc>();
                            return SliverToBoxAdapter(
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return PostWidget(
                                    post: postState.posts[index],
                                    postLikeBloc: postLikeBloc,
                                    postWriteCommentBloc: postWriteCommentBloc,
                                  );
                                },
                                separatorBuilder: (context, index) => Divider(
                                  thickness: 4,
                                  height: 16,
                                ),
                                itemCount: postState.posts.length,
                              ),
                            );
                          }
                          return SliverFillRemaining(
                            child: CustomDataReceiveErrorWidget(
                              onTap: () {
                                context.read<PostBloc>().add(
                                      FetchPostEvent(),
                                    );
                              },
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

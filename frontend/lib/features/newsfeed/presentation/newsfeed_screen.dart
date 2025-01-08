import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_connector/app/di.dart';
import 'package:travel_connector/core/color/app_colors.dart';
import 'package:travel_connector/core/widget/custom_circular_indicator_widget.dart';
import 'package:travel_connector/core/widget/custom_data_recieve_error_widget.dart';
import 'package:travel_connector/features/newsfeed/presentation/bloc/post/post_bloc.dart';

import 'widget/post_widget.dart';

class NewsfeedScreen extends StatelessWidget {
  const NewsfeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(getIt())
        ..add(
          FetchPostEvent(),
        ),
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
                            child: Center(
                              child: Text(
                                  "Посты отсутствуют\nСоздайте пост используя кнопку в правом нижнем углу экрана"),
                            ),
                          );
                        }
                        if (postState is PostError) {
                          return SliverFillRemaining(
                            child: CustomDataReceiveErrorWidget(
                              onTap: () {
                                context.read<PostBloc>().add(
                                      FetchPostEvent(),
                                    );
                              },
                            ),
                          );
                        }
                        if (postState is PostSuccess) {
                          return SliverToBoxAdapter(
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return PostWidget(
                                  post: postState.posts[index],
                                );
                              },
                              separatorBuilder: (context, index) => Container(
                                height: 6,
                                margin: EdgeInsets.symmetric(vertical: 8),
                                color: Color.fromRGBO(248, 249, 250, 1),
                              ),
                              itemCount: postState.posts.length,
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
            ),
          );
        },
      ),
    );
  }
}

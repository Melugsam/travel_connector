import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_connector/core/injector/di.dart';
import 'package:travel_connector/core/manager/notification_manager.dart';
import 'package:travel_connector/core/widget/custom_circular_indicator_widget.dart';
import 'package:travel_connector/core/widget/custom_data_receive_error_widget.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';
import 'package:travel_connector/features/newsfeed/presentation/bloc/post_write_comment/post_write_comment_bloc.dart';

import 'bloc/post_comment/post_comment_bloc.dart';
import 'widget/add_comment_widget.dart';
import 'widget/comment_widget.dart';
import 'widget/post_widget.dart';

class CommentsScreen extends StatelessWidget {
  final PostEntity post;

  const CommentsScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostCommentBloc(
            getIt(),
          )..add(
              FetchCommentEvent(postId: post.id),
            ),
        ),
      ],
      child: BlocListener<PostWriteCommentBloc, PostWriteCommentState>(
        listener: (context, state) {
          if (state is PostWriteCommentSuccess) {
            getIt<NotificationManager>()
                .showSuccess(message: state.comment.message);
            context.read<PostCommentBloc>().add(
                  FetchCommentEvent(postId: post.id),
                );
          }
          if (state is PostWriteCommentError) {
            getIt<NotificationManager>().showError(message: state.message);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Комментарии"),
          ),
          body: Column(
            children: [
              PostWidget(
                post: post,
                showDetails: false,
              ),
              Divider(
                thickness: 4,
              ),
              Expanded(
                child: BlocBuilder<PostCommentBloc, PostCommentState>(
                  builder: (context, state) {
                    if (state is PostCommentLoading) {
                      return CustomCircularIndicatorWidget();
                    }
                    if (state is PostCommentError) {
                      return CustomDataReceiveErrorWidget(
                        onTap: () {
                          context.read<PostCommentBloc>().add(
                                FetchCommentEvent(postId: post.id),
                              );
                        },
                      );
                    }
                    if (state is PostCommentEmpty) {
                      return Center(
                        child: Text("Комментарии отсутствуют"),
                      );
                    }
                    if (state is PostCommentSuccess) {
                      return ListView.separated(
                        itemCount: state.comments.length,
                        itemBuilder: (context, index) {
                          final comment = state.comments[index];
                          return CommentWidget(comment: comment);
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 8,
                        ),
                      );
                    }
                    return SizedBox.expand();
                  },
                ),
              ),
              BlocBuilder<PostWriteCommentBloc, PostWriteCommentState>(
                builder: (context, state) {
                  if (state is PostWriteCommentLoading) {
                    return CustomCircularIndicatorWidget();
                  }
                  return AddCommentWidget(
                    onAddComment: (content) {
                      context.read<PostWriteCommentBloc>().add(
                            ExecuteWriteCommentEvent(
                              postId: post.id,
                              content: content,
                            ),
                          );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

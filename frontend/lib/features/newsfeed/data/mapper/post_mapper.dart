import 'package:travel_connector/features/newsfeed/data/model/post_response_model.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';

class PostMapper {
   List<PostEntity> mapToEntity(List<PostResponseModel> model) {
    return model.map((e) {
      return PostEntity(
        id: e.id,
        title: e.title,
        description: e.description,
        createdAt: e.createdAt,
        likesCount: e.likesCount,
        commentsCount: e.commentsCount,
        likedBy: e.likedBy,
        liked: e.liked,
        user: PostUserEntity(
          id: e.user.id,
          name: e.user.name,
          avatar: e.user.avatar,
        ),
        images: e.images.map((e) => e.url,).toList(),
        comments: e.comments.map((comment) {
          return PostCommentEntity(
            id: comment.id,
            content: comment.content,
            createdAt: comment.createdAt,
            user: PostUserEntity(
              id: comment.user.id,
              name: comment.user.name,
              avatar: comment.user.avatar,
            ),
          );
        }).toList(),
        route: e.route != null
            ? MapRouteEntity(
          markers: e.route!.markers.map((m) {
            return MarkerEntity(
              latitude: m.point.latitude,
              longitude: m.point.longitude,
              type: m.type,
              label: m.label,
            );
          }).toList(),
          routes: e.route!.routes.map((r) {
            return RouteConnectionEntity(
              fromIndex: r.fromIndex,
              toIndex: r.toIndex,
            );
          }).toList(),
        )
            : null,
      );
    }).toList();
  }
}

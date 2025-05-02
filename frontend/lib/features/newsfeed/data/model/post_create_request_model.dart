import 'dart:convert';
import 'dart:io';
import 'package:travel_connector/features/newsfeed/data/model/post_response_model.dart';

class PostCreateRequestModel {
  final String description;
  final String title;
  final List<File> images;
  final MapRouteModel? route;

  PostCreateRequestModel({
    required this.description,
    required this.title,
    required this.images,
    this.route,
  });

}

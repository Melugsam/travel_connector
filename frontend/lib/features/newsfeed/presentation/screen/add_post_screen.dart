import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_connector/core/router/routes.dart';
import 'package:travel_connector/core/widget/custom_button_widget.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_create_request_model.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_response_model.dart';
import 'package:travel_connector/features/newsfeed/presentation/bloc/post/post_bloc.dart';
import 'package:travel_connector/features/newsfeed/presentation/bloc/post_create/post_create_bloc.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final List<File> images = [];
  final picker = ImagePicker();

  bool allowComments = true;
  MapRouteModel? attachedRoute;

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        images.add(File(pickedFile.path));
      });
    }
  }

  void _submitPost() {
    if (!isFormValid) return;

    final model = PostCreateRequestModel(
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
      images: images,
      route: attachedRoute,
    );

    context.read<PostCreateBloc>().add(SendPostCreateEvent(model));
  }

  bool get isFormValid =>
      titleController.text.trim().isNotEmpty &&
      descriptionController.text.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCreateBloc, PostCreateState>(
      listener: (context, state) {
        if (state is PostCreateSuccess) {
          context.pop(true);
        }
        if (state is PostCreateFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Ошибка публикации: ${state.errorMessage}')),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is PostCreateLoading;

        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(title: const Text('Новый пост')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox.expand(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextField(
                            titleController, 'Заголовок', 'Введите заголовок'),
                        const SizedBox(height: 16),
                        _buildTextField(descriptionController, 'Описание',
                            'Введите описание',
                            maxLines: 5),
                        const SizedBox(height: 16),
                        Row(children: const [
                          Icon(Icons.attach_file),
                          SizedBox(width: 8),
                          Text('Прикрепить фото')
                        ]),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            ...images.map(
                              (img) => Image.file(img,
                                  width: 80, height: 80, fit: BoxFit.cover),
                            ),
                            GestureDetector(
                              onTap: _pickImage,
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(child: Icon(Icons.add)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Icon(Icons.route),
                            const SizedBox(width: 8),
                            const Text('Маршрут'),
                            TextButton(
                              onPressed: () {
                                context
                                    .pushNamed(
                                  'addMap',
                                  extra:
                                      MapRouteArguments(route: attachedRoute),
                                )
                                    .then(
                                  (result) {
                                    if (result is MapRouteModel) {
                                      setState(() => attachedRoute = result);
                                    }
                                  },
                                );
                              },
                              child: const Text('Добавить маршрут'),
                            ),
                            if (attachedRoute != null)
                              const Icon(Icons.check_circle,
                                  color: Colors.green),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButtonWidget(
                            text: 'Опубликовать',
                            icon: Icons.send,
                            onPressed: isFormValid ? () => _submitPost() : null,
                            outline: false,
                            height: 48,
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    String hint, {
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
          ),
          onChanged: (_) => setState(() {}),
        ),
      ],
    );
  }
}

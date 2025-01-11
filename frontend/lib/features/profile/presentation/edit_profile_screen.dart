import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travel_connector/core/color/app_colors.dart';
import 'package:travel_connector/core/widget/custom_button_widget.dart';
import 'package:travel_connector/core/widget/custom_default_avatar_widget.dart';
import 'package:travel_connector/core/widget/custom_text_labeled_form_widget.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  final String currentName;
  final String currentProfileDescription;
  final String? currentAvatarUrl;

  const EditProfileScreen({
    required this.currentName,
    required this.currentProfileDescription,
    required this.currentAvatarUrl,
    super.key,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _profileDescriptionController =
      TextEditingController();
  XFile? _selectedAvatar;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.currentName;
    _profileDescriptionController.text = widget.currentProfileDescription;
  }

  Future<void> _requestPermissions() async {
    if (await Permission.photos.isDenied) {
      await Permission.photos.request();
    }
  }

  Future<void> _pickAvatar() async {
    await _requestPermissions();
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _selectedAvatar = pickedFile;
        });
      }
    } catch (e) {
      debugPrint("Ошибка загрузки изображения: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Изменить профиль'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: _pickAvatar,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomDefaultAvatarWidget(
                      radius: 50,
                      avatarUrl: widget.currentAvatarUrl,
                      avatarPath: _selectedAvatar?.path,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.black,
                        child: Icon(
                          Icons.edit,
                          size: 16,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),
            CustomTextLabeledForm(
              title: 'Имя пользователя',
              hint: 'Введите имя пользователя',
              isPassword: false,
              controller: _nameController,
            ),
            SizedBox(height: 16),
            CustomTextLabeledForm(
              title: 'Описание',
              hint: 'Введите описание',
              isPassword: false,
              controller: _profileDescriptionController,
            ),
            SizedBox(height: 32),
            Center(
              child: CustomButtonWidget(
                text: "Сохранить изменения",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

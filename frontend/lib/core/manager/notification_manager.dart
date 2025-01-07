import 'package:flutter/material.dart';
import 'package:travel_connector/core/color/app_colors.dart';
import 'package:travel_connector/core/service/notification_service.dart';

class NotificationManager {
  final NotificationService _notificationService;

  NotificationManager(this._notificationService);

  void showSuccess({required String message, int? autoCloseDuration}) {
    _notificationService.showNotification(
      title: 'Успех',
      message: message,
      icon: Icons.notifications_on,
      iconColor: AppColors.white,
      textColor: AppColors.white,
      backgroundColor: AppColors.success,
      autoCloseDuration: autoCloseDuration,
    );
  }

  void showError({required String message, int? autoCloseDuration}) {
    _notificationService.showNotification(
      title: 'Ошибка',
      message: message,
      icon: Icons.warning,
      iconColor: AppColors.white,
      textColor: AppColors.white,
      backgroundColor: AppColors.error,
      autoCloseDuration: autoCloseDuration,
    );
  }
}
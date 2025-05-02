import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class NotificationService {
  void showNotification({
    required String title,
    required String message,
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required Color textColor,
    int? autoCloseDuration,
  }) {
    toastification.show(
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      description: Text(
        message,
        style: TextStyle(color: textColor),
      ),
      icon: Icon(
        icon,
        color: iconColor,
      ),
      progressBarTheme: ProgressIndicatorThemeData(
        color: textColor,
        linearTrackColor: backgroundColor,
      ),
      autoCloseDuration: Duration(
        seconds: autoCloseDuration ?? 5,
      ),
      backgroundColor: backgroundColor,
      closeButtonShowType: CloseButtonShowType.none,
    );
  }
}

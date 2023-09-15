import 'package:flutter/material.dart';
import 'package:laundryapp/widgets/custom_toast.dart';
import 'package:bot_toast/bot_toast.dart';

class Toast {
  static void showToast({required String message, required ToastType type}) {
    BotToast.showCustomNotification(
        dismissDirections: [
          DismissDirection.horizontal,
          DismissDirection.vertical
        ],
        duration: const Duration(seconds: 4),
        toastBuilder: (_) => CustomToast(message: message, type: type));
  }
}

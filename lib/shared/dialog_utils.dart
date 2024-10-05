// lib/shared/dialog_utils.dart
import 'package:flutter/material.dart';

class DialogUtils {
  static Future<void> showConfirmationDialog(
      BuildContext context, String title, String content, Function onConfirm) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: Text("Hủy"),
            ),
            TextButton(
              onPressed: () {
                onConfirm(); // Gọi hàm xác nhận
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: Text("Xác nhận"),
            ),
          ],
        );
      },
    );
  }
}

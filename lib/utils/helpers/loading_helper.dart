import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/utils/helpers/dialog_helper.dart';
import 'package:flutter/material.dart';

class LoadingHelper {
  static bool _loadingDialogShowed = false;

  static void show() {
    final context = Application.context;
    if (context == null || _loadingDialogShowed) {
      return;
    }
    _loadingDialogShowed = true;
    DialogHelper.showAnimatedDialog(
      animationType: DialogAnimationType.none,
      barrierDismissible: false,
      pageBuilder: (context, a1, a2) {
        return const Center(
          child: FlatCard(
            borderRadius: 16.0,
            child: CircularProgressIndicator(),
          ),
        );
      },
    ).then((value) => _loadingDialogShowed = false);
  }

  static Future<void> close() async {
    if (!_loadingDialogShowed) {
      return Future.value();
    }
    if (Application.context == null) {
      return Future.value();
    }
    Navigator.of(Application.context!).pop();
    await Future.delayed(const Duration(milliseconds: 300));
    close();
  }
}

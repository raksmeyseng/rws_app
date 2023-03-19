import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/widgets/dialogs/confirm_dialog.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/helpers/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  static Future<bool> requestGalleryPermission() async {
    if (Platform.isIOS || Platform.isMacOS) {
      final status = await Permission.photos.request();
      if (status == PermissionStatus.permanentlyDenied) {
        final confirmed = await DialogHelper.showAnimatedDialog<bool?>(
          pageBuilder: (_, __, ___) {
            return ConfirmDialog(
              icon: const Icon(
                Icons.settings,
                size: 70,
                color: AppColor.white,
              ),
              title: S.current.photo_permission,
              message: S.current.msg_allow_photo_permission,
              confirmText: S.current.button_ok,
            );
          },
        );
        if (confirmed == true) {
          await openAppSettings();
        }
      }
      return status.isGranted || status == PermissionStatus.limited;
    } else if (Platform.isAndroid) {
      final info = await DeviceInfoPlugin().androidInfo;
      final permission =
          info.version.sdkInt >= 33 ? Permission.photos : Permission.storage;
      final status = await permission.request();
      if (status == PermissionStatus.permanentlyDenied) {
        final confirmed = await DialogHelper.showAnimatedDialog<bool?>(
          pageBuilder: (_, __, ___) {
            return ConfirmDialog(
              icon: const Icon(
                Icons.settings,
                size: 70,
                color: AppColor.white,
              ),
              title: S.current.storage_permission,
              message: S.current.msg_allow_storage_permission,
              confirmText: S.current.button_ok,
            );
          },
        );
        if (confirmed == true) {
          await openAppSettings();
        }
      }
      return status.isGranted;
    } else {
      return false;
    }
  }

  static Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status == PermissionStatus.permanentlyDenied) {
      final confirmed = await DialogHelper.showAnimatedDialog<bool?>(
        pageBuilder: (_, __, ___) {
          return ConfirmDialog(
            icon: const Icon(
              Icons.settings,
              size: 70,
              color: AppColor.white,
            ),
            title: S.current.camera_permission,
            message: S.current.msg_allow_camera_permission,
            confirmText: S.current.button_ok,
          );
        },
      );
      if (confirmed == true) {
        await openAppSettings();
      }
    }
    return status.isGranted;
  }

  static Future<bool> requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status == PermissionStatus.permanentlyDenied) {
      final confirmed = await DialogHelper.showAnimatedDialog<bool?>(
        pageBuilder: (_, __, ___) {
          return ConfirmDialog(
            icon: const Icon(
              Icons.settings,
              size: 70,
              color: AppColor.white,
            ),
            title: S.current.location_permission,
            message: S.current.msg_allow_location_permission,
            confirmText: S.current.button_ok,
          );
        },
      );
      if (confirmed == true) {
        await openAppSettings();
      }
    }
    return status.isGranted;
  }
}

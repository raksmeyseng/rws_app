import 'package:rws_app/core/models/image_saver_result_model.dart';
import 'package:rws_app/utils/helpers/permission_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class ImageSaverHelper {
  static Future<ImageSaverResultModel> saveImage(
    Uint8List bytes, {
    String? fileName,
  }) async {
    final hasPermission = await PermissionHelper.requestGalleryPermission();
    if (!hasPermission) {
      throw Exception('No permission');
    }
    final result = await ImageGallerySaver.saveImage(
      bytes,
      name: fileName,
      isReturnImagePathOfIOS: true,
    );
    final map = Map<String, dynamic>.from(result);
    return ImageSaverResultModel.fromJson(map);
  }
}

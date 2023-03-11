import 'dart:io';

import 'package:rws_app/config/routes/application.dart';
import 'package:url_launcher/url_launcher_string.dart';

class VersionHelper {
  static Future<void> openExternalStore() async {
    final setting = Application.appBloc.state.appSetting;
    if (setting == null) return;
    if (Platform.isAndroid) {
      launchUrlString(
        setting.playStoreUrl,
        mode: LaunchMode.externalApplication,
      );
    } else if (Platform.isIOS) {
      launchUrlString(
        setting.appStoreUrl,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  static bool canUpdate(String localVersion, String storeVersion) {
    final local = localVersion.split('.').map(int.parse).toList();
    final store = storeVersion.split('.').map(int.parse).toList();

    // Each consecutive field in the version notation is less significant than the previous one,
    // therefore only one comparison needs to yield `true` for it to be determined that the store
    // version is greater than the local version.
    for (var i = 0; i < store.length; i++) {
      // The store version field is newer than the local version.
      if (store[i] > local[i]) {
        return true;
      }

      // The local version field is newer than the store version.
      if (local[i] > store[i]) {
        return false;
      }
    }

    // The local and store versions are the same.
    return false;
  }
}

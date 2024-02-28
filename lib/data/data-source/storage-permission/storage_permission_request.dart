import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'storage_permission_request.g.dart';

class StoragePermission {
  static Future<bool> getStoragepermission(Permission permission) async {
    AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
    if (build.version.sdkInt >= 30) {
      final request = await permission.request();
      if (request.isGranted) {
        return true;
      } else {
        return false;
      }
    } else {
      if (await permission.isGranted) {
        return true;
      } else {
        final result = await permission.request();
        if (result.isGranted) {
          return true;
        } else {
          return false;
        }
      }
    }
  }
}

@riverpod
Future<bool> storagePermission(
    StoragePermissionRef ref, Permission permission) {
  return StoragePermission.getStoragepermission(permission);
}

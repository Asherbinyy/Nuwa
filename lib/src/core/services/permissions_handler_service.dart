import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

import '../logger/app_logger.dart';

abstract class IPermissionHandler {
  Future<bool> request();
}

@Injectable(as: IPermissionHandler)
class PermissionsHandlerService implements IPermissionHandler {
  @override
  Future<bool> request() async {
    if (kIsWeb) return true;

    if (Platform.isAndroid) {
      return _handleAndroidPermissions();
    } else if (Platform.isIOS) {
      return _handleIOSPermissions();
    } else {
      logger('Unsupported platform. Assuming no permission needed.');
      return true;
    }
  }

  Future<bool> _handleAndroidPermissions() async {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    final sdkVersion = androidInfo.version.sdkInt;

    if (sdkVersion < 33) {
      final status = await Permission.storage.request();

      if (status.isGranted) {
        return true;
      } else if (status.isPermanentlyDenied) {
        await openAppSettings();
      }
      return false;
    } else {
      return true;
    }
  }

  Future<bool> _handleIOSPermissions() async {
    final status = await Permission.storage.request();

    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
    return false;
  }
}

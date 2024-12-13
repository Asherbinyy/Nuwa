import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class IPermissionHandler {
  Future<bool> request();
}

@LazySingleton(as: IPermissionHandler)
class PermissionsHandlerService implements IPermissionHandler {
  @override
  Future<bool> request() async {
    if (kIsWeb) return true;

    final status = await Permission.storage.request();
    return status.isGranted;
  }
}

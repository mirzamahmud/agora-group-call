import 'package:permission_handler/permission_handler.dart';

class AppPermissionHandler {
  // ============================= private constructor =======================================
  AppPermissionHandler._singleton();

  // ============================= singleton instance ========================================
  static final AppPermissionHandler _instance = AppPermissionHandler._singleton();

  // ============================= getter to access the instance =============================
  static AppPermissionHandler get instance => _instance;

  // ============================= initialize permission when app start ======================
  Future<void> initialize() async{
    await [
      Permission.camera,
      Permission.microphone,
    ].request();
  }

}
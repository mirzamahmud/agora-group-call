import 'package:agora_group_call/routes/app_routes.dart';
import 'package:get/get.dart';

class RoleController extends GetxController {
  void joinCall() {
    Get.toNamed(AppRoutes.videoCall);
  }
}

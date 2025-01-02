import 'dart:async';

import 'package:agora_group_call/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  // ======================= manage session =========================
  void manageSession(){
    Timer(const Duration(seconds: 4), (){
      Get.offAllNamed(AppRoutes.role);
    });
  }

  @override
  void onInit() {
    super.onInit();
    manageSession();
  }
}
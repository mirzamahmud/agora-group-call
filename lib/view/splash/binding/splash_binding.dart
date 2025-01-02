import 'package:agora_group_call/view/splash/controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
import 'package:agora_group_call/routes/app_routes.dart';
import 'package:agora_group_call/view/role/binding/role_binding.dart';
import 'package:agora_group_call/view/role/role_view.dart';
import 'package:agora_group_call/view/splash/binding/splash_binding.dart';
import 'package:agora_group_call/view/splash/splash_view.dart';
import 'package:agora_group_call/view/video_call/binding/video_call_binding.dart';
import 'package:agora_group_call/view/video_call/video_call_view.dart';
import 'package:get/get.dart';

class AppPages {

  AppPages._();

  static const initialPage = AppRoutes.splash;

  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashView(), binding: SplashBinding()),
    GetPage(name: AppRoutes.role, page: () => const RoleView(), binding: RoleBinding()),
    GetPage(name: AppRoutes.videoCall, page: () => const VideoCallView(), binding: VideoCallBinding()),
  ];
}
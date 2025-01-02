import 'package:agora_group_call/routes/app_pages.dart';
import 'package:agora_group_call/view/splash/binding/splash_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgoraGroupCall extends StatelessWidget {
  const AgoraGroupCall({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agora Group Call',
      initialRoute: AppPages.initialPage,
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
    );
  }
}
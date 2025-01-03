import 'package:agora_group_call/agora_group_call.dart';
import 'package:agora_group_call/config/handler/app_permission_handler.dart';
import 'package:agora_group_call/core/dependency/inject_dependency.dart';
import 'package:agora_group_call/utils/device/device_utils.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppPermissionHandler.instance.initialize();
  DeviceUtils.instance.initialize();
  injectDependency();

  runApp(const AgoraGroupCall());
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceUtils {
  DeviceUtils._();

  static final DeviceUtils _instance = DeviceUtils._();
  static DeviceUtils get instance => _instance;

  void initialize(){
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white
    ));
  }
}
import 'package:agora_group_call/view/video_call/controller/video_call_controller.dart';
import 'package:get/get.dart';

class VideoCallBinding  extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => VideoCallController());
  }
}
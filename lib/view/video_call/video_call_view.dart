import 'package:agora_group_call/config/constants/agora_constant.dart';
import 'package:agora_group_call/view/video_call/controller/video_call_controller.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoCallView extends GetView<VideoCallController> {
  const VideoCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          titleSpacing: 12,
          title: const Text(
            'Video Call',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon:
                  const Icon(Icons.arrow_back, color: Colors.white, size: 20)),
          actions: [
            // ========================== rotate camera ==============================
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: GestureDetector(
                  onTap: () {
                    controller.onSwitchCamera();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Colors.white38, shape: BoxShape.circle),
                    child: Obx(() {
                      return controller.isCameraSwitch.value
                          ? const Icon(Icons.rotate_left,
                              color: Colors.white, size: 20)
                          : const Icon(Icons.rotate_right,
                              color: Colors.white, size: 20);
                    }),
                  )),
            )
          ],
        ),
        body: Row(
          children: [
            // ======================= local user view ============================
            Expanded(
              flex: 2,
              child: Padding(
                padding: controller.remoteUserList.value.isEmpty
                    ? const EdgeInsetsDirectional.only(
                        start: 16, end: 16, top: 20, bottom: 120)
                    : const EdgeInsetsDirectional.only(
                        start: 16, top: 20, bottom: 120),
                child: SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: Obx(() {
                    if (controller.localUserJoined.value) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: AgoraVideoView(
                          controller: VideoViewController(
                            useFlutterTexture: true,
                            rtcEngine: controller.engine,
                            canvas: const VideoCanvas(uid: 0),
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                              color: Colors.white, strokeWidth: 2),
                        ),
                      );
                    }
                  }),
                ),
              ),
            ),
            // ======================= remote user view ===========================
            Obx(() {
              if (controller.remoteUserList.value.isEmpty) {
                return const SizedBox();
              } else {
                return Expanded(
                  flex: 1,
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 16),
                    child: ListView.separated(
                      itemCount: controller.remoteUserList.value.length,
                      padding: const EdgeInsetsDirectional.only(
                          top: 20, bottom: 120),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final remoteUser =
                            controller.remoteUserList.value[index];
                        return SizedBox(
                          height: 150,
                          width: Get.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: AgoraVideoView(
                              controller: VideoViewController.remote(
                                useFlutterTexture: true,
                                rtcEngine: controller.engine,
                                canvas: VideoCanvas(uid: remoteUser),
                                connection: const RtcConnection(
                                    channelId: AgoraConstant.channelName),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            })
          ],
        ),
        bottomNavigationBar: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            width: Get.width,
            padding: const EdgeInsetsDirectional.symmetric(
                vertical: 20, horizontal: 20),
            decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ============================= camera off =====================================
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 56,
                    width: 56,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Colors.white38, shape: BoxShape.circle),
                    child: const Icon(Icons.camera_alt_rounded,
                        color: Colors.white, size: 28),
                  ),
                ),

                // ============================= microphone off ====================================
                Obx(() {
                  return GestureDetector(
                    onTap: () {
                      controller.onToggleMute();
                    },
                    child: Container(
                      height: 56,
                      width: 56,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Colors.white38, shape: BoxShape.circle),
                      child: controller.isMuted.value
                          ? const Icon(Icons.mic_off_outlined,
                              color: Colors.white, size: 28)
                          : const Icon(Icons.mic_none,
                              color: Colors.white, size: 28),
                    ),
                  );
                }),

                // ============================= end call ==========================================
                GestureDetector(
                  onTap: () {
                    controller.endCall();
                  },
                  child: Container(
                    height: 56,
                    width: 56,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: const Icon(Icons.call_end,
                        color: Colors.white, size: 28),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

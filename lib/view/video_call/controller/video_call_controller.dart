import 'package:agora_group_call/config/constants/agora_constant.dart';
import 'package:get/get.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:agora_rtm/agora_rtm.dart';

class VideoCallController extends GetxController {
  // ================================ variables =====================================
  Rx<bool> isMuted = false.obs;
  Rx<bool> localUserJoined = false.obs;
  Rx<List<int>> remoteUserList = Rx([]);

  // ================================ agora variable ================================
  late final RtcEngine engine;
  late RtmClient rtmClient;
  late RtmChannelType rtmChannel;

  // ================================ initialize agora ==============================
  Future<void> initializeAgora() async {
    // ============================== agora engine initalize ========================================================
    await engine.initialize(const RtcEngineContext(
      appId: AgoraConstant.appId,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    ));

    // ========================== Enable the video module ===========================================================
    await engine.enableVideo();
    // ========================== Enable local video preview ========================================================
    await engine.startPreview();

    // ============================== engine set event handler =======================================================
    engine.registerEventHandler(RtcEngineEventHandler(
      onError: (err, msg) {},
      onJoinChannelSuccess: (connection, elapsed) {
        localUserJoined.value = true;
      },
      onLeaveChannel: (connection, stats) {
        remoteUserList.value.clear();
      },
      onUserJoined: (connection, remoteUid, elapsed) {
        remoteUserList.value.add(remoteUid);
        remoteUserList.refresh();
      },
      onUserOffline: (connection, remoteUid, reason) {
        remoteUserList.value.remove(remoteUid);
        remoteUserList.refresh();
      },
      onFirstRemoteAudioFrame: (connection, userId, elapsed) {},
    ));

    await engine.joinChannel(
        token: AgoraConstant.agoraToken,
        channelId: AgoraConstant.channelName,
        uid: 0,
        options: const ChannelMediaOptions(
            // ======================= Automatically subscribe to all video streams ===================================
            autoSubscribeVideo: true,
            // ======================= Automatically subscribe to all audio streams ====================================
            autoSubscribeAudio: true,
            // ======================= Publish camera video ============================================================
            publishCameraTrack: true,
            // ======================= Publish microphone audio ========================================================
            publishMicrophoneTrack: true,
            // ======================= Set user role to clientRoleBroadcaster (broadcaster) or clientRoleAudience (audience) =========================
            clientRoleType: ClientRoleType.clientRoleBroadcaster));
  }

  // ================================ mute microphone ===========================================
  void onToggleMute() {
    isMuted.value = !isMuted.value;
    engine.muteLocalAudioStream(isMuted.value);
  }

  // ================================ switch camera =============================================
  Rx<bool> isCameraSwitch = false.obs;
  void onSwitchCamera() {
    isCameraSwitch.value = !isCameraSwitch.value;
    engine.switchCamera();
  }

  // ================================ end call ===================================================
  void endCall() {
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
    engine = createAgoraRtcEngine();
    initializeAgora();
  }

  @override
  void onClose() {
    super.onClose();
    remoteUserList.value.clear();
    engine.leaveChannel();
    engine.release();
  }
}

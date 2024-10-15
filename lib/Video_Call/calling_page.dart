import 'dart:math';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

// class CallingPage extends StatefulWidget {
//   final String callId;
//   const CallingPage({super.key, required this.callId});
//
//   @override
//   State<CallingPage> createState() => _CallingPageState();
// }
//
// class _CallingPageState extends State<CallingPage> {
//   final userId = Random().nextInt(1000);
//
//   @override
//   Widget build(BuildContext context) {
//     return ZegoUIKitPrebuiltCall(
//       appID: 515976007, // your AppID,
//       appSign:
//           "15013b621c51548b635b86526009e46b24908abe7bee2016f1185f37f05c14db",
//       userID: userId.toString(),
//       userName: 'User_Name$userId',
//       callID: widget.callId,
//       config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
//     );
//   }
// }
class AudioCallRoomScreen extends StatefulWidget {
  final String callId;
  const AudioCallRoomScreen({super.key, required this.callId});

  @override
  State<AudioCallRoomScreen> createState() => _AudioCallRoomScreenState();
}

class _AudioCallRoomScreenState extends State<AudioCallRoomScreen> {
  final userId = Random().nextInt(1000);

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltVideoConference(
      appID: 1579569118, // Your ZEGOCLOUD appID
      appSign:
          "7029cb6fb0c30bbd98bb7f195d317e78115328a1d66c6e43e1afdc8a61f69b73", // Your ZEGOCLOUD appSign
      userID: userId.toString(),
      userName: "User_$userId", // Set a user-friendly name
      conferenceID: widget.callId,
      config: ZegoUIKitPrebuiltVideoConferenceConfig(),
    );
  }
}

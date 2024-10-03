import 'dart:math';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallingPage extends StatefulWidget {
  final String callId;
  const CallingPage({super.key, required this.callId});

  @override
  State<CallingPage> createState() => _CallingPageState();
}

class _CallingPageState extends State<CallingPage> {
  final userId = Random().nextInt(1000);

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 515976007, // your AppID,
      appSign:
          "15013b621c51548b635b86526009e46b24908abe7bee2016f1185f37f05c14db",
      userID: userId.toString(),
      userName: 'User_Name$userId',
      callID: widget.callId,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}

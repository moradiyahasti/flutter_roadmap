import 'package:flutter/material.dart';
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';
import 'package:vibration/vibration.dart';

class VibrationScreen extends StatefulWidget {
  const VibrationScreen({super.key});

  @override
  State<VibrationScreen> createState() => _VibrationScreenState();
}

class _VibrationScreenState extends State<VibrationScreen> {
  final shakeKey = GlobalKey<ShakeWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 50,
        ),
        GestureDetector(
          onTap: () {
            shakeKey.currentState?.shake();
            Vibration.vibrate(duration: 500);
          },
          child: ShakeMe(
              key: shakeKey,
              shakeCount: 3,
              shakeOffset: 10,
              shakeDuration: const Duration(milliseconds: 600),
              // Add the child widget that will be animated
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.pink[100],
                ),
              )),
        )
      ]),
    );
  }
}

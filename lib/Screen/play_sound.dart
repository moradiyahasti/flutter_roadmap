// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../video_player/asset_network.dart';
import '../video_player/video.dart';

class PlaySound_Screen extends StatefulWidget {
  const PlaySound_Screen({super.key});

  @override
  State<PlaySound_Screen> createState() => _PlaySound_ScreenState();
}

class _PlaySound_ScreenState extends State<PlaySound_Screen> {
  // play audio
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    // listen to audio duration
    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    // listen to audio position
    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    //play video
  }

  @override
  void dispose() {
    super.dispose();
    //play video
  }

  // play video

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  player.play(AssetSource("audio/a.mp3"));
                },
                child: const Text("A")),
            ElevatedButton(
                onPressed: () {
                  player.play(AssetSource("audio/apple.mp3"));
                },
                child: const Text("apple")),
            ElevatedButton(
                onPressed: () {
                  player.play(AssetSource("audio/apricot.mp3"));
                },
                child: const Text("apricot")),
            ElevatedButton(
                onPressed: () {
                  player.play(AssetSource("audio/april.mp3"));
                },
                child: const Text("april")),
            SizedBox(
              height: 10,
            ),
            Text("Play Sound"),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                if (isPlaying) {
                  player.pause();
                } else {
                  player.play(UrlSource(
                      "https://storage.googleapis.com/uamp/The_Kyoto_Connection_-_Wake_Up/08_-_Reveal_the_Magic.mp3"));
                }
                setState(() {
                  isPlaying = !isPlaying;
                });
              },
              child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            ),
            Slider(
                value: position.inSeconds.toDouble(),
                min: 0,
                activeColor: Colors.blue,
                max: duration.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await player.seek(position);
                  await player.resume();
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(position)),
                  Text(formatTime(duration - position)),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => YoutubePlayerDemo());
                },
                child: Text("Youtube Player")),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => VideoPlayerPage());
                },
                child: Text("Asset & Network Player")),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, twoDigitMinutes, twoDigitSeconds]
        .join(':');
  }
}

// ignore_for_file: deprecated_member_use, constant_identifier_names

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Source { Asset, Network }

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({Key? key}) : super(key: key);

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late CustomVideoPlayerController customVideoPlayerController;
  String assetVideoPath = "assets/videos/natural.mp4";
  Uri networkVideoUrl = Uri.parse(
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
  Source currentSource = Source.Asset;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer(currentSource);
  }

  Widget _sourceButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        MaterialButton(
          onPressed: () {
            setState(() {
              currentSource = Source.Network;
              initializeVideoPlayer(currentSource);
            });
          },
          color: Colors.brown,
          child: const Text("Network"),
        ),
        MaterialButton(
          onPressed: () {
            setState(() {
              currentSource = Source.Asset;
              initializeVideoPlayer(currentSource);
            });
          },
          color: Colors.brown,
          child: const Text("Asset"),
        ),
      ],
    );
  }

  void initializeVideoPlayer(Source source) {
    VideoPlayerController videoPlayerController;
    if (source == Source.Asset) {
      videoPlayerController = VideoPlayerController.asset(assetVideoPath)
        ..initialize().then((value) {
          setState(() {});
        });
    } else if (source == Source.Network) {
      videoPlayerController =
          VideoPlayerController.network(networkVideoUrl.toString())
            ..initialize().then((value) {
              setState(() {});
            });
    } else {
      return;
    }
    customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: videoPlayerController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back))),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: SizedBox(
              height: 250,
              width: 400,
              child: CustomVideoPlayer(
                customVideoPlayerController: customVideoPlayerController,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _sourceButton(),
          const SizedBox(
            height: 30,
          )
        ]),
      ),
    );
  }
}

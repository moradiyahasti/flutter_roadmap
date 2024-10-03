// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:photo_view_v3/photo_view.dart';

class XoomImage_Screen extends StatefulWidget {
  const XoomImage_Screen({super.key});

  @override
  State<XoomImage_Screen> createState() => _XoomImage_ScreenState();
}

class _XoomImage_ScreenState extends State<XoomImage_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoView(
          imageProvider: const AssetImage("assets/images/img.png"),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_connectivity/Language/home_language.dart';
import 'package:network_connectivity/Todo/screens/home.dart';
import 'package:network_connectivity/provider/fav_home.dart';
import 'package:network_connectivity/vibration/vibration.dart';
import 'BottomNavBar/bottombar.dart';
import 'Google_Map/map.dart';
import 'OTP_Verification/otp_screen.dart';
import 'Screen/download.dart';
import 'Screen/pageview with dot indicator.dart';
import 'Screen/pdf.dart';
import 'Screen/play_sound.dart';
import 'Screen/stepper.dart';
import 'Screen/web_view.dart';
import 'Screen/zoom_image.dart';
import 'camera/image_picker & croper.dart';
import 'network/network connectivity.dart';

class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController();
  List<String> cities = [
    'Ahmadabad',
    'Amreli',
    'Bharuch',
    'Bhavnagar',
    'Gandhinagar'
  ];

  /* void _showCityBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: cities.map((city) {
            return ListTile(
              title: Text(city),
              onTap: () {
                // Set the selected city in the TextFormField
                _cityController.text = city;
                Navigator.pop(context); // Close the bottom sheet
              },
            );
          }).toList(),
        );
      },
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
        backgroundColor: Colors.redAccent[100],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const CheckInternet(
                        title: '',
                      ));
                },
                child: const Text("Internet Connectivity Check")),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const BottomNavigationBarScreen());
              },
              child: const Text("BottomNavigationBarScreen")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const Language_Home());
              },
              child: const Text("Language_Home")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const VibrationScreen());
              },
              child: const Text("Vibration")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const PlaySound_Screen());
              },
              child: const Text("Play Audio")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(const SingleDownloadScreen());
              },
              child: const Text("Download image")),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const XoomImage_Screen());
              },
              child: const Text("Image")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const MyWebsite());
              },
              child: const Text("Web View")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const FavoriteHomeScreen());
              },
              child: const Text("Provider")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => Home());
              },
              child: const Text("TODO List")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => ImageSliderScreen());
              },
              child: const Text("Slider")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const PdfScreen());
              },
              child: const Text("PDF")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const Stepper_Screen());
              },
              child: const Text("Flutter Stepper")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => LocationDemo());
              },
              child: Text("Map")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => SendOTPScreen());
              },
              child: Text("OTP Verification")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const Image_Cropper_Picker());
              },
              child: const Text("Image Cropper")),
          const SizedBox(
            height: 25,
          ),
        ]),
      ),
    );
  }
}

import 'dart:math';  // To generate a random OTP
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _numberController = TextEditingController();
  String _otp = '';  // Variable to store the generated OTP

  // Function to generate a 6-digit OTP
  String _generateOtp() {
    var random = Random();
    return (random.nextInt(900000) + 100000).toString();  // Generates a 6-digit number
  }

  // Function that triggers when the Send button is tapped
  void _sendOtp() {
    if (_numberController.text.isNotEmpty) {
      setState(() {
        _otp = _generateOtp();  // Generate the OTP
      });
      // Here you can also send the OTP via an SMS API if needed.
    } else {
      // Show a message if the number field is empty
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter a number')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter your number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _sendOtp,
              child: Text('Send'),
            ),
            SizedBox(height: 16),
            if (_otp.isNotEmpty) // Show OTP only when it is generated
              Text(
                'Your OTP is: $_otp',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}

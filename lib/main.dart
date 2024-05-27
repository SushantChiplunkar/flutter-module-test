import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Send SMS Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: _sendSMS,
            child: const Text('Send SMS'),
          ),
        ),
      ),
    );
  }

  void _sendSMS() async {
    const phoneNumber = '1234567890'; // Replace with your phone number
    const message = 'Hello, this is a test message!';

    final smsUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: <String, String>{
        'body': message,
      },
    );

    if (await canLaunchUrlString(smsUri.toString())) {
      await launchUrlString(smsUri.toString());
    } else {
      print('Could not launch $smsUri');
    }
  }
}

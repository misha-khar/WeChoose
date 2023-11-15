// splash_screen.dart
import 'package:flutter/material.dart';
import 'main_screen_v1.dart'; // Import the main_screen.dart file

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: locationController,
              decoration: const InputDecoration(
                hintText: 'Enter your location',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(
                      location: locationController.text,
                      locationType: '',
                    ),
                  ),
                );
              },
              child: const Text('Go to Main Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

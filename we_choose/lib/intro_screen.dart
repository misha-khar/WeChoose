// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  String location = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intro Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await _getLocation();
              },
              child: const Text('Get Location'),
            ),
            const SizedBox(height: 16),
            Text('Location: $location'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (location.isNotEmpty) {
                  // Navigate to the main screen with the obtained location
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(location: location),
                    ),
                  );
                } else {
                  // Show a notification or tooltip indicating that the location is required
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please provide your location.'),
                    ),
                  );
                }
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getLocation() async {
    final location = Location();

    try {
      final currentLocation = await location.getLocation();
      setState(() {
        this.location =
            'Lat: ${currentLocation.latitude}, Lng: ${currentLocation.longitude}';
      });
    } catch (e) {
      // Handle location access exception
      print('Error getting location: $e');
    }
  }
}

class MainScreen extends StatelessWidget {
  final String location;

  const MainScreen({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Center(
        child: Text('Location: $location'),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    ),
  );
}

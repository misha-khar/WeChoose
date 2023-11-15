import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final String location;

  // Add a constructor to receive the location
  const MainScreen({Key? key, required this.location}) : super(key: key);

  // Extract the zip code from the location string
  String get zipCode {
    // You may need to adjust the logic based on the format of your location data
    final parts = location.split(',');
    if (parts.length > 2) {
      final zipCode = parts[parts.length - 2].trim();
      return zipCode;
    } else {
      return 'N/A';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John Doe', // Replace with user's name
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'User Type', // Replace with user's type
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Add any logic to handle location editing
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.blue),
                          const SizedBox(width: 8),
                          // Display the zip code in the location label
                          Text(
                            zipCode,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Rest of the content
            // Add your CardSwiper and other widgets here
          ],
        ),
      ),
    );
  }
}

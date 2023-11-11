import 'package:flutter/cupertino.dart';

class ExampleCandidateModel {
  String name;
  String address;
  List<Color> color;
  String placeId; // Add place ID
  String imageUrl; // Add image URLs

  ExampleCandidateModel({
    required this.name,
    required this.address,
    required this.color,
    required this.placeId,
    required this.imageUrl,
  });
}


final List<ExampleCandidateModel> candidates = [
  ExampleCandidateModel(
    name: 'One, 1',
    address: '123 Main St, Anytown, USA',
    placeId: '12345',
    imageUrl: 'https://images.pexels.com/photos/19065473/pexels-photo-19065473/free-photo-of-a-view-of-the-blue-mosque-from-a-window.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    color: const [Color(0xFFFF3868), Color(0xFFFFB49A)],
  ),
  ExampleCandidateModel(
    name: 'Two, 2',
    address: '123 Main St, Anytown, USA',
    placeId: '12345',
    imageUrl: 'https://images.pexels.com/photos/19065473/pexels-photo-19065473/free-photo-of-a-view-of-the-blue-mosque-from-a-window.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    color: const [Color(0xFF736EFE), Color(0xFF62E4EC)],
  ),
  ExampleCandidateModel(
    name: 'Three, 3',
    address: '123 Main St, Anytown, USA',
    placeId: '12345',
    imageUrl: 'https://images.pexels.com/photos/19065473/pexels-photo-19065473/free-photo-of-a-view-of-the-blue-mosque-from-a-window.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
  ),
  ExampleCandidateModel(
    name: 'Four, 4',
    address: '123 Main St, Anytown, USA',
    placeId: '12345',
    imageUrl: 'https://images.pexels.com/photos/19065473/pexels-photo-19065473/free-photo-of-a-view-of-the-blue-mosque-from-a-window.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    color: const [Color(0xFF0BA4E0), Color(0xFFA9E4BD)],
  ),
];

// main_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'example_candidate_model.dart';
import 'example_card.dart';

class MainScreen extends StatefulWidget {
  final String location;
  final String locationType;

  const MainScreen({
    Key? key,
    required this.location,
    required this.locationType,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final CardSwiperController controller = CardSwiperController();

  final cards = candidates.map(ExampleCard.new).toList();

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
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.blue),
                        const SizedBox(width: 8),
                        Text(
                          widget.location,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: CardSwiper(
                controller: controller,
                cardsCount: cards.length,
                numberOfCardsDisplayed: 1,
                backCardOffset: const Offset(40, 40),
                padding: const EdgeInsets.all(24.0),
                cardBuilder: (
                  context,
                  index,
                  horizontalThresholdPercentage,
                  verticalThresholdPercentage,
                ) =>
                    cards[index],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: controller.undo,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(color: Colors.blue),
                    ),
                    tooltip: 'Undo',
                    child: const Icon(Icons.restore, color: Colors.grey),
                  ),
                  FloatingActionButton(
                    onPressed: controller.swipeLeft,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(color: Colors.blue),
                    ),
                    tooltip: 'Dislike',
                    child: const Icon(Icons.close, color: Colors.red),
                  ),
                  FloatingActionButton(
                    onPressed: controller.swipeRight,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(color: Colors.blue),
                    ),
                    tooltip: 'Like',
                    child: const Icon(Icons.favorite, color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

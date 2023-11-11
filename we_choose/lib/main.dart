import 'example_candidate_model.dart';
import 'example_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Example(),
    ),
  );
}

class Example extends StatefulWidget {
  const Example({
    Key? key,
  }) : super(key: key);

  @override
  State<Example> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<Example> {
  final CardSwiperController controller = CardSwiperController();

  final cards = candidates.map(ExampleCard.new).toList();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: CardSwiper(
                controller: controller,
                cardsCount: cards.length,
                onSwipe: _onSwipe,
                onUndo: _onUndo,
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
                    foregroundColor:
                        Colors.blue, // Change this to the desired outline color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30.0), // Adjust the radius as needed
                      side: const BorderSide(color: Colors.blue),
                    ),
                    tooltip: 'Undo',
                    child: const Icon(
                      Icons.restore,
                      color: Colors.grey,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: controller.swipeLeft,
                    backgroundColor: Colors.white,
                    foregroundColor:
                        Colors.blue, // Change this to the desired outline color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30.0), // Adjust the radius as needed
                      side: const BorderSide(color: Colors.blue),
                    ),
                    tooltip: 'Dislike',
                    child: const Icon(Icons.close, color: Colors.red),
                  ),
                  FloatingActionButton(
                    onPressed: controller.swipeRight,
                    backgroundColor: Colors.white,
                    foregroundColor:
                        Colors.blue, // Change this to the desired outline color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30.0), // Adjust the radius as needed
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

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}

final List<ExampleCandidateModel> candidates = [
  ExampleCandidateModel(
    name: 'Location 1',
    address: '123 Main St, Cityville',
    color: const [Color(0xFFFF3868), Color(0xFFFFB49A)],
    placeId: 'your_yelp_place_id_1',
    imageUrl:
        'https://images.pexels.com/photos/67468/pexels-photo-67468.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ),
  ExampleCandidateModel(
    name: 'Location 2',
    address: '456 Oak St, Townsville',
    color: const [Color(0xFF736EFE), Color(0xFF62E4EC)],
    placeId: 'your_yelp_place_id_2',
    imageUrl:
        'https://images.pexels.com/photos/914388/pexels-photo-914388.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ),
  ExampleCandidateModel(
    name: 'Location 3',
    address: '789 Pine St, Villageton',
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
    placeId: 'your_yelp_place_id_3',
    imageUrl:
        'https://images.pexels.com/photos/984888/pexels-photo-984888.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ),
  ExampleCandidateModel(
    name: 'Location 4',
    address: '1011 Elm St, Hamletville',
    color: const [Color(0xFF0BA4E0), Color(0xFFA9E4BD)],
    placeId: 'your_yelp_place_id_4',
    imageUrl:
        'https://images.pexels.com/photos/4450334/pexels-photo-4450334.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ),
  // Add other locations similarly
];

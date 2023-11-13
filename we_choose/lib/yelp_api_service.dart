import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey;

  ApiService(this.apiKey);

  Future<List<Map<String, dynamic>>> fetchYelpData(String location) async {
    const String apiUrl = 'https://api.yelp.com/v3/businesses/search';

    final response = await http.get(
      Uri.parse('$apiUrl?location=$location&sort_by=best_match&limit=5'),
      headers: {
        'Authorization': 'Bearer $apiKey',
      },
    );

    if (response.statusCode == 200) {
      // Parse the JSON response
      Map<String, dynamic> data = json.decode(response.body);
      List<Map<String, dynamic>> businesses = List.from(data['businesses']);
      return businesses;
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load data from Yelp API');
    }
  }
}

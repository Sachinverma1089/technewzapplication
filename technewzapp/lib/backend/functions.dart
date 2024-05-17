import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:technewzapp/components/searchbar.dart';
import 'package:technewzapp/utils/key.dart';

Future<List<dynamic>> fetchnews() async {
  try {
    // Check if search text is available
    String searchText = SearchBarPage.searchcontroller.text ?? '';

    final response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=' +
              ApiKey.key +
              '&q=' +
              searchText),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      print(result);

      return result['articles'];
    } else if (response.statusCode == 426) {
      // Handle 426 status code
      print('Upgrade Required: ${response.reasonPhrase}');
      // You might inform the user that an upgrade is required or take appropriate action
      return [];
    } else {
      // Handle other status codes
      print('Failed to load data: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    // Handle any potential errors during the HTTP request
    print('Error: $e');
    return [];
  }
}

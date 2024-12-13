import 'dart:convert';

import 'package:flutter_application_1/model/cocktail.model.dart';
import 'package:flutter_application_1/services/api_service.dart';

class CocktailService {
  final ApiService apiService;

  CocktailService({required this.apiService});

  Future<Cocktail> getRandomCocktail() async {
    try {
      final response = await apiService.get('/random.php');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return Cocktail.fromJson(data['drinks'][0]);
      } else {
        throw Exception('Failed to load drink');
      }
    } catch (e) {
      throw Exception('Error fetching drink: $e');
    }
  }
}

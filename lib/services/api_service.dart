import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1';

  Future<http.Response> post(String endpoint, Map<String, String> data) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.post(url, body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
    });
    return response;
  }

  Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.get(url, headers: {});
    return response;
  }
}

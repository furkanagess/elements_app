import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:elements_app/feature/model/info.dart';
import 'package:elements_app/feature/model/periodic_element.dart';

/// The `ApiService` class is responsible for making API requests to fetch data for periodic elements and information
/// in your Flutter application. It provides methods to fetch and parse data from specified API endpoints.
class ApiService {
  /// Fetches and returns a list of periodic elements based on the specified API endpoint.
  ///
  /// [apiType]: The API endpoint for the elements you want to fetch.
  Future<List<PeriodicElement>> fetchElements(String apiType) async {
    final response = await http.get(Uri.parse(apiType));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => PeriodicElement.fromJson(e)).toList();
    } else {
      throw Exception('API request failed: ${response.statusCode}');
    }
  }

  /// Fetches and returns a list of information based on the specified API endpoint.
  ///
  /// [apiType]: The API endpoint for the information you want to fetch.
  Future<List<Info>> fetchInfo(String apiType) async {
    final response = await http.get(Uri.parse(apiType));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => Info.fromJson(e)).toList();
    } else {
      throw Exception('API request failed: ${response.statusCode}');
    }
  }
}

import 'package:elements_app/feature/model/periodic_element.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<List<PeriodicElement>> fetchElements(String apiType) async {
    final response = await http.get(Uri.parse(apiType));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => PeriodicElement.fromJson(e)).toList();
    } else {
      throw Exception('API isteği başarısız oldu: ${response.statusCode}');
    }
  }
}
// TODO fix api service using very_good_analysis
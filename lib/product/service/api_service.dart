import 'package:elements_app/product/model/periodic_element.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String apiUrl =
      'https://raw.githubusercontent.com/furkanagess/periodic_table_data_set/master/all_elements.json'; // API endpointini buraya ekleyin

  Future<List<PeriodicElement>> fetchElements() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => PeriodicElement.fromJson(e)).toList();
    } else {
      throw Exception('API isteği başarısız oldu: ${response.statusCode}');
    }
  }
}

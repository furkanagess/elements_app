import 'package:elements_app/product/constants/api_constans.dart';
import 'package:elements_app/product/model/table_element.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<List<TableElement>> fetchElements() async {
    final response = await http.get(Uri.parse(ApiConstants.allElements));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => TableElement.fromJson(e)).toList();
    } else {
      throw Exception('API isteği başarısız oldu: ${response.statusCode}');
    }
  }
}

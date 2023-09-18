import 'package:elements_app/product/model/table_element.dart';
import 'package:elements_app/product/service/api_service.dart';
import 'package:elements_app/product/widget/element_card.dart';
import 'package:flutter/material.dart';

class ElementsListScreen extends StatefulWidget {
  const ElementsListScreen({super.key});

  @override
  State<ElementsListScreen> createState() => _ElementsListScreenState();
}

class _ElementsListScreenState extends State<ElementsListScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<TableElement>> _elementList;

  @override
  void initState() {
    super.initState();
    _elementList = _apiService.fetchElements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Periyodik Tablo Elementleri'),
      ),
      body: FutureBuilder<List<TableElement>>(
        future: _elementList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
          } else {
            final elements = snapshot.data;
            return ListView.builder(
              itemCount: elements!.length,
              itemBuilder: (context, index) {
                final element = elements[index];
                return ElementCard(
                  element: element,
                );
              },
            );
          }
        },
      ),
    );
  }
}

import 'package:elements_app/product/model/periodic_element.dart';
import 'package:elements_app/product/service/api_service.dart';
import 'package:elements_app/product/widget/element_card.dart';
import 'package:flutter/material.dart';

class ElementListScreen extends StatefulWidget {
  const ElementListScreen({super.key});

  @override
  _ElementListScreenState createState() => _ElementListScreenState();
}

class _ElementListScreenState extends State<ElementListScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<PeriodicElement>> _elementList;

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
      body: FutureBuilder<List<PeriodicElement>>(
        future: _elementList,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
          } else {
            final List<PeriodicElement>? elements = snapshot.data;
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

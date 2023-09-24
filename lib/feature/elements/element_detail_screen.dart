import 'package:elements_app/product/model/periodic_element.dart';
import 'package:flutter/material.dart';

class ElementDetailScreen extends StatelessWidget {
  final PeriodicElement element;

  const ElementDetailScreen({
    super.key,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${element.name} Detayları'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sembol: ${element.symbol}'),
            Text('Ağırlık: ${element.weight}'),
            Text('Kategori: ${element.category}'),
            Text('Blok: ${element.block}'),
            Text('Periyot: ${element.period}'),
            Text('Açıklama: ${element.description}'),
            Text('Kullanım Alanı: ${element.usage}'),
            Text('Kaynak: ${element.source}'),
            Text('Renk: ${element.colors}'),
          ],
        ),
      ),
    );
  }
}

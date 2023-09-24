import 'package:elements_app/product/model/periodic_element.dart';
import 'package:flutter/material.dart';

class ElementCard extends StatelessWidget {
  final PeriodicElement element;

  const ElementCard({
    super.key,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('${element.number}. ${element.name} (${element.symbol})'),
        subtitle:
            Text('Category: ${element.category}, Block: ${element.block}'),
        // Diğer element özelliklerini buraya ekleyebilirsiniz
      ),
    );
  }
}

import 'package:elements_app/feature/elements/element_detail_screen.dart';
import 'package:elements_app/product/model/table_element.dart';
import 'package:flutter/material.dart';

class ElementCard extends StatelessWidget {
  final TableElement element;

  const ElementCard({
    super.key,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('${element.number}. ${element.name} (${element.symbol})'),
        subtitle:
            Text('Category: ${element.category}, Block: ${element.block}'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ElementDetailScreen(element: element),
            ),
          );
        },
      ),
    );
  }
}

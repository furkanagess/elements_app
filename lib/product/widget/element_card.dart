import 'package:elements_app/feature/view/detail/element_detail_page.dart';
import 'package:elements_app/feature/model/periodic_element.dart';
import 'package:flutter/material.dart';

@immutable
final class ElementCard extends StatelessWidget {
  final PeriodicElement element;

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
              builder: (context) => ElementDetailPage(element: element),
            ),
          );
        },
      ),
    );
  }
}

import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class VerticalSpacer extends StatelessWidget {
  const VerticalSpacer({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(height),
    );
  }
}

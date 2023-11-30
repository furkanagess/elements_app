import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class HorizontalSpacer extends StatelessWidget {
  const HorizontalSpacer({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicHeight(width),
    );
  }
}

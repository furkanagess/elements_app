import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

@immutable
class ElementSymbolContainer extends StatelessWidget {
  const ElementSymbolContainer({
    super.key,
    this.title,
    this.color,
    this.shadowColor,
  });
  final String? title;
  final Color? color;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.20),
      width: context.dynamicWidth(0.30),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5),
        boxShadow: [
          BoxShadow(
            color: shadowColor!,
            offset: const Offset(4, 4),
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Center(
        child: Text(
          title!,
          style: context.textTheme.displayMedium?.copyWith(
            color: AppColors.background,
          ),
        ),
      ),
    );
  }
}

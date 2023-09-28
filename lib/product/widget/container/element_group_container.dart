import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

@immutable
class ElementGroupContainer extends StatelessWidget {
  const ElementGroupContainer({
    super.key,
    this.onTap,
    this.color,
    this.shadowColor,
    this.title,
  });
  final VoidCallback? onTap;
  final Color? color;
  final Color? shadowColor;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.dynamicHeight(0.2),
        width: context.dynamicWidth(0.4),
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
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.background,
            ),
          ),
        ),
      ),
    );
  }
}

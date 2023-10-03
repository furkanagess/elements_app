import 'package:elements_app/product/constants/themeConstants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

@immutable
final class TextIconRow extends StatelessWidget {
  const TextIconRow({
    super.key,
    this.title,
    this.color,
    this.icon,
  });
  final String? title;
  final Color? color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 30,
          color: color,
        ),
        Text(
          title!,
          style: context.textTheme.bodyLarge?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

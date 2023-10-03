import 'package:elements_app/product/constants/themeConstants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

@immutable
final class ElementInfoRow extends StatelessWidget {
  const ElementInfoRow({
    super.key,
    this.title,
    this.value,
  });
  final String? title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLowVertical,
      child: Row(
        children: [
          Text(
            title!,
            style: context.textTheme.titleLarge?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: context.paddingLowHorizontal,
            child: Text(
              value!,
              style: context.textTheme.titleLarge?.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

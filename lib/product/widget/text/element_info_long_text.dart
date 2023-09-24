import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

@immutable
class ElementInfoParagraph extends StatelessWidget {
  const ElementInfoParagraph({
    super.key,
    this.title,
    this.paragraph,
  });
  final String? title;
  final String? paragraph;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: context.textTheme.titleMedium?.copyWith(
            color: AppColors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
          child: Text(
            paragraph!,
            style: context.textTheme.bodySmall?.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}

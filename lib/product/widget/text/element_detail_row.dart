import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

@immutable
class ElementDetailRowText extends StatelessWidget {
  const ElementDetailRowText({
    super.key,
    this.title,
    this.value,
  });
  final String? title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title!,
          style: context.textTheme.titleMedium?.copyWith(
            color: AppColors.white,
          ),
        ),
        Text(
          value!,
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

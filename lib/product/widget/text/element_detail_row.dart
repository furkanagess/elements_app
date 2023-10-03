import 'package:elements_app/product/constants/themeConstants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

@immutable
final class ElementDetailRowText extends StatelessWidget {
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Text(
            title!,
            style: context.textTheme.titleLarge?.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value!,
            style: context.textTheme.titleLarge?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

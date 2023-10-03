import 'package:elements_app/product/constants/themeConstants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

@immutable
final class FeedbackLongTextField extends StatelessWidget {
  const FeedbackLongTextField({
    super.key,
    this.controller,
    this.title,
  });
  final TextEditingController? controller;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        cursorColor: AppColors.background,
        keyboardType: TextInputType.multiline,
        maxLines: 6,
        style: const TextStyle(color: AppColors.background),
        maxLength: 300,
        decoration: InputDecoration(
          hintStyle: context.textTheme.bodyMedium
              ?.copyWith(color: AppColors.background),
          hintText: title,
          hoverColor: AppColors.background,
          focusColor: AppColors.background,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.background),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.background),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.background),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.background),
          ),
        ),
      ),
    );
  }
}

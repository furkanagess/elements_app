import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

@immutable
class FeedbackLongTextField extends StatelessWidget {
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
        keyboardType: TextInputType.multiline,
        maxLines: 6,
        maxLength: 300,
        decoration: InputDecoration(
          hintStyle: context.textTheme.bodyMedium
              ?.copyWith(color: AppColors.lightWhite),
          hintText: title,
          hoverColor: AppColors.white,
          focusColor: AppColors.white,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.white),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.white),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}

import 'package:elements_app/product/constants/themeConstants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

@immutable
final class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    this.title,
    this.onTap,
  });
  final String? title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.dynamicWidth(0.7),
        height: context.dynamicHeight(0.06),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.background,
        ),
        child: Center(
          child: Text(
            title!,
            style: context.textTheme.bodyLarge
                ?.copyWith(color: AppColors.powderRed),
          ),
        ),
      ),
    );
  }
}

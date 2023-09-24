import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

@immutable
class GradientButton extends StatelessWidget {
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
          gradient: const LinearGradient(
            colors: [
              Colors.purple,
              Colors.pink,
              Colors.orange,
              Colors.yellow,
            ],
          ),
        ),
        child: Center(
          child: Text(
            title!,
            style:
                context.textTheme.bodyLarge?.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}

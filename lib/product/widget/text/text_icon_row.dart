import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

@immutable
final class TextIconRow extends StatelessWidget {
  const TextIconRow({
    super.key,
    this.title,
    this.color,
  });
  final String? title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.darkBlue,
      ),
      width: context.width,
      height: context.dynamicHeight(0.1),
      child: Padding(
        padding: context.paddingLow,
        child: Row(
          children: [
            Icon(
              Icons.science,
              size: 30,
              color: color,
            ),
            SizedBox(
              width: context.dynamicWidth(0.02),
            ),
            Expanded(
              child: Text(
                title!,
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

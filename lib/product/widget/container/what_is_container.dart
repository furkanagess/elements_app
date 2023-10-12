import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/assets_constants.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@immutable
final class WhatIsContainer extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final Color color;
  final Color shColor;
  const WhatIsContainer({
    super.key,
    required this.title,
    required this.color,
    required this.shColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.dynamicHeight(0.075),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: shColor,
              offset: const Offset(4, 4),
              spreadRadius: 1,
            ),
          ],
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: context.paddingLowHorizontal,
          child: Row(
            children: [
              SvgPicture.asset(
                AssetConstants.instance.svgQuestionTwo,
                height: context.dynamicHeight(0.05),
              ),
              SizedBox(
                width: context.dynamicWidth(0.02),
              ),
              Text(
                title,
                style: context.textTheme.headlineSmall?.copyWith(
                  color: AppColors.background,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_right_alt_outlined,
                size: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}

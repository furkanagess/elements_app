import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@immutable
class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key,
    this.onTap,
    this.color,
    this.shadowColor,
    this.title,
    this.svg,
  });
  final VoidCallback? onTap;
  final Color? color;
  final Color? shadowColor;
  final String? title;
  final String? svg;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.dynamicHeight(0.2),
        width: context.dynamicWidth(0.4),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: shadowColor!,
              offset: const Offset(4, 4),
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                svg!,
                color: AppColors.background,
                height: context.dynamicHeight(0.1),
              ),
              Text(
                title!,
                style: context.textTheme.headlineSmall?.copyWith(
                  color: AppColors.background,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

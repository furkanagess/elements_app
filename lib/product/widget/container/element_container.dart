import 'package:elements_app/feature/model/periodic_element.dart';
import 'package:elements_app/feature/view/detail/element_detail_page.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/extensions/color_extension.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

@immutable
final class ElementContainer extends StatelessWidget {
  final PeriodicElement element;
  const ElementContainer({
    super.key,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ElementDetailPage(element: element),
            ),
          );
        },
        child: Container(
          width: context.dynamicWidth(0.7),
          height: context.dynamicHeight(0.075),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: element.shColor?.toColor(),
                offset: const Offset(4, 4),
                spreadRadius: 1,
              ),
            ],
            color: element.colors?.toColor(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: context.dynamicHeight(0.04),
                    left: context.dynamicHeight(0.01),
                    right: context.dynamicHeight(0.005)),
                child: Text(
                  element.number.toString(),
                  style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.background,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                element.symbol.toString(),
                style: context.textTheme.headlineLarge?.copyWith(
                  color: AppColors.background,
                ),
              ),
              const Spacer(),
              Text(
                element.name.toString(),
                style: context.textTheme.headlineSmall?.copyWith(
                  color: AppColors.background,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  top: context.dynamicHeight(0.04),
                  right: context.dynamicHeight(0.01),
                ),
                child: Text(
                  element.weight.toString(),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.background,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:elements_app/feature/model/periodic_element.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/app_strings.dart';
import 'package:elements_app/product/constants/assets_constants.dart';
import 'package:elements_app/product/extensions/color_extension.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/container/element_symbol_container.dart';
import 'package:elements_app/product/widget/text/element_detail_row.dart';
import 'package:elements_app/product/widget/text/element_info_long_text.dart';
import 'package:elements_app/product/widget/text/element_info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ElementDetailView extends StatelessWidget {
  final PeriodicElement element;
  const ElementDetailView({
    super.key,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                const SliverAppBar(),
              ],
          body: SingleChildScrollView(
            child: Padding(
              padding: context.paddingNormal,
              child: Column(
                children: [
                  symbolAndInfoRow(context),
                  spacer(context, 0.05),
                  categoryContainer(context),
                  spacer(context, 0.03),
                  blockPeriodGroupContainer(context),
                  spacer(context, 0.03),
                  elementInfoContainer(context),
                ],
              ),
            ),
          )),
    );
  }

  SizedBox spacer(BuildContext context, double value) =>
      SizedBox(height: context.dynamicHeight(value));

  Container blockPeriodGroupContainer(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.darkBlue,
      ),
      child: Padding(
        padding: context.paddingNormal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: blockPart(),
            ),
            verticalWhiteDivider(),
            Expanded(
              child: periodPart(),
            ),
            verticalWhiteDivider(),
            Expanded(
              child: groupPart(),
            ),
          ],
        ),
      ),
    );
  }

  VerticalDivider verticalWhiteDivider() {
    return const VerticalDivider(
      thickness: 1,
      color: AppColors.white,
    );
  }

  ElementDetailRowText groupPart() {
    return ElementDetailRowText(title: AppStrings.group, value: element.group);
  }

  ElementDetailRowText periodPart() {
    return ElementDetailRowText(
        title: AppStrings.period, value: element.period);
  }

  ElementDetailRowText blockPart() {
    return ElementDetailRowText(title: AppStrings.block, value: element.block);
  }

  VerticalDivider verticalDivider() {
    return const VerticalDivider(
      color: Colors.white,
      thickness: 2,
    );
  }

  Container categoryContainer(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.08),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: element.colors?.toColor(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            element.category.toString().toUpperCase(),
            style: context.textTheme.titleLarge?.copyWith(
              color: AppColors.background,
            ),
          )
        ],
      ),
    );
  }

  Container elementInfoContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.darkBlue,
      ),
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          mainAxisSize: MainAxisSize.min, // Column'un boyutunu minimize et
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                descriptionParagraph(),
                dividerSVG(context),
                usageParagraph(),
                dividerSVG(context),
                sourceParagraph(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget dividerSVG(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: SvgPicture.asset(
        AssetConstants.instance.svgTestTube,
        color: Colors.white,
        height: context.dynamicHeight(0.035),
      ),
    );
  }

  ElementInfoParagraph sourceParagraph() {
    return ElementInfoParagraph(
      title: AppStrings.source,
      paragraph: element.source,
    );
  }

  ElementInfoParagraph usageParagraph() {
    return ElementInfoParagraph(
      title: AppStrings.usage,
      paragraph: element.usage,
    );
  }

  ElementInfoParagraph descriptionParagraph() {
    return ElementInfoParagraph(
      title: AppStrings.description,
      paragraph: element.description,
    );
  }

  Row symbolAndInfoRow(BuildContext context) {
    return Row(
      children: [
        ElementSymbolContainer(
          title: element.symbol,
          color: element.colors?.toColor(),
          shadowColor: AppColors.background,
        ),
        SizedBox(width: context.dynamicWidth(0.05)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElementInfoRow(title: AppStrings.name, value: element.name),
            ElementInfoRow(
                title: AppStrings.number, value: element.number.toString()),
            ElementInfoRow(title: AppStrings.weight, value: element.weight),
          ],
        ),
      ],
    );
  }
}

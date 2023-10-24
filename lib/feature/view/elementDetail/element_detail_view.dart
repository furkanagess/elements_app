// ignore_for_file: deprecated_member_use

import 'package:elements_app/feature/model/periodic_element.dart';
import 'package:elements_app/feature/provider/localization_provider.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/stringConstants/en_app_strings.dart';
import 'package:elements_app/product/constants/assets_constants.dart';
import 'package:elements_app/product/constants/stringConstants/tr_app_strings.dart';
import 'package:elements_app/product/extensions/color_extension.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/container/element_symbol_container.dart';
import 'package:elements_app/product/widget/scaffold/app_scaffold.dart';
import 'package:elements_app/product/widget/text/element_detail_row.dart';
import 'package:elements_app/product/widget/text/element_info_long_text.dart';
import 'package:elements_app/product/widget/text/element_info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ElementDetailView extends StatelessWidget {
  final PeriodicElement element;
  const ElementDetailView({
    super.key,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    bool isTr = Provider.of<LocalizationProvider>(context).isTr;
    return AppScaffold(
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  const SliverAppBar(),
                ],
            body: SingleChildScrollView(
              child: Padding(
                padding: context.paddingNormal,
                child: Column(
                  children: [
                    symbolAndInfoRow(context, isTr),
                    spacer(context, 0.05),
                    categoryContainer(context, isTr),
                    spacer(context, 0.03),
                    blockPeriodGroupContainer(context, isTr),
                    spacer(context, 0.03),
                    elementInfoContainer(context, isTr),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  SizedBox spacer(BuildContext context, double value) =>
      SizedBox(height: context.dynamicHeight(value));

  Container blockPeriodGroupContainer(BuildContext context, bool isTr) {
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
              child: blockPart(isTr),
            ),
            verticalWhiteDivider(),
            Expanded(
              child: periodPart(isTr),
            ),
            verticalWhiteDivider(),
            Expanded(
              child: groupPart(isTr),
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

  ElementDetailRowText groupPart(bool isTr) {
    return ElementDetailRowText(
        title: isTr ? TrAppStrings.group : EnAppStrings.group,
        value: element.group);
  }

  ElementDetailRowText periodPart(bool isTr) {
    return ElementDetailRowText(
        title: isTr ? TrAppStrings.period : EnAppStrings.period,
        value: element.period);
  }

  ElementDetailRowText blockPart(bool isTr) {
    return ElementDetailRowText(
        title: isTr ? TrAppStrings.block : EnAppStrings.block,
        value: element.block);
  }

  VerticalDivider verticalDivider() {
    return const VerticalDivider(
      color: Colors.white,
      thickness: 2,
    );
  }

  Container categoryContainer(BuildContext context, bool isTr) {
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
            isTr
                ? element.trCategory.toString().toUpperCase()
                : element.enCategory.toString().toUpperCase(),
            style: context.textTheme.titleLarge?.copyWith(
              color: AppColors.background,
            ),
          )
        ],
      ),
    );
  }

  Container elementInfoContainer(BuildContext context, bool isTr) {
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
                descriptionParagraph(isTr),
                dividerSVG(context),
                usageParagraph(isTr),
                dividerSVG(context),
                sourceParagraph(isTr),
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

  ElementInfoParagraph sourceParagraph(bool isTr) {
    return ElementInfoParagraph(
      title: isTr ? TrAppStrings.source : EnAppStrings.source,
      paragraph: isTr ? element.trSource : element.enSource,
    );
  }

  ElementInfoParagraph usageParagraph(bool isTr) {
    return ElementInfoParagraph(
      title: isTr ? TrAppStrings.usage : EnAppStrings.usage,
      paragraph: isTr ? element.trUsage : element.enUsage,
    );
  }

  ElementInfoParagraph descriptionParagraph(bool isTr) {
    return ElementInfoParagraph(
      title: isTr ? TrAppStrings.description : EnAppStrings.description,
      paragraph: isTr ? element.trDescription : element.enDescription,
    );
  }

  Row symbolAndInfoRow(BuildContext context, bool isTr) {
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
            ElementInfoRow(
              title: isTr ? TrAppStrings.name : EnAppStrings.name,
              value: isTr ? element.trName : element.enName,
            ),
            ElementInfoRow(
              title: isTr ? TrAppStrings.number : EnAppStrings.number,
              value: element.number.toString(),
            ),
            ElementInfoRow(
              title: isTr ? TrAppStrings.weight : EnAppStrings.weight,
              value: element.weight,
            ),
          ],
        ),
      ],
    );
  }
}

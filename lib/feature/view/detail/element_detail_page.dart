import 'package:elements_app/feature/model/periodic_element.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/extensions/color_extension.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/container/element_symbol_container.dart';
import 'package:elements_app/product/widget/text/element_detail_row.dart';
import 'package:elements_app/product/widget/text/element_info_long_text.dart';
import 'package:elements_app/product/widget/text/element_info_row.dart';
import 'package:flutter/material.dart';

class ElementDetailPage extends StatelessWidget {
  final PeriodicElement element;
  const ElementDetailPage({
    super.key,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
      ),
      backgroundColor: AppColors.background,
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
      ),
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
                child:
                    ElementDetailRowText(title: 'Blok', value: element.block)),
            const VerticalDivider(
              color: Colors.white,
              thickness: 2,
            ),
            Expanded(
              child:
                  ElementDetailRowText(title: 'Periyot', value: element.period),
            ),
            const VerticalDivider(
              color: Colors.white,
              thickness: 2,
            ),
            Expanded(
                child:
                    ElementDetailRowText(title: 'Grup', value: element.group)),
          ],
        ),
      ),
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
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Column'un boyutunu minimize et
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                ElementInfoParagraph(
                  title: 'Tanım',
                  paragraph: element.description,
                ),
                SizedBox(height: context.dynamicHeight(0.05)),
                ElementInfoParagraph(
                  title: 'Kullanım Alanları',
                  paragraph: element.usage,
                ),
                SizedBox(height: context.dynamicHeight(0.05)),
                ElementInfoParagraph(
                  title: 'Kaynak',
                  paragraph: element.source,
                ),
              ],
            ),
          ],
        ),
      ),
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
            ElementInfoRow(title: 'İsim:  ', value: element.name),
            ElementInfoRow(
                title: 'Numara:  ', value: element.number.toString()),
            ElementInfoRow(title: 'Ağırlık:  ', value: element.weight),
          ],
        ),
      ],
    );
  }

  SliverAppBar buildSliverAppbar(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.background,
      title: Flexible(
        child: Padding(
          padding: context.paddingLow,
          child: TextField(
            decoration: InputDecoration(
              hintText: "search",
              hintStyle: context.textTheme.titleMedium?.copyWith(
                color: AppColors.lightWhite,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: AppColors.lightWhite,
              ),
              filled: true,
              fillColor: AppColors.transparentWhite,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

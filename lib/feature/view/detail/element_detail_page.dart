import 'package:elements_app/feature/model/periodic_element.dart';
import 'package:elements_app/product/constants/app_colors.dart';
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
              SizedBox(height: context.dynamicHeight(0.03)),
              symbolAndInfoRow(context),
              SizedBox(height: context.dynamicHeight(0.07)),
              elementInfoContainer(context),
            ],
          ),
        ),
      ),
    );
  }

  Container elementInfoContainer(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.darkBlue,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElementDetailRowText(title: 'Blok', value: element.block),
                ElementDetailRowText(title: 'Periyot', value: element.period),
                ElementDetailRowText(title: 'Grup', value: element.group),
              ],
            ),
            SizedBox(height: context.dynamicHeight(0.03)),
            const Divider(
              color: AppColors.white,
              thickness: 2,
            ),
            SizedBox(height: context.dynamicHeight(0.05)),
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
      ),
    );
  }

  Row symbolAndInfoRow(BuildContext context) {
    return Row(
      children: [
        ElementSymbolContainer(
          title: element.symbol,
          color: AppColors.banana,
          shadowColor: AppColors.lightYellow,
        ),
        SizedBox(width: context.dynamicWidth(0.05)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElementInfoRow(
                title: 'Number:  ', value: element.number.toString()),
            ElementInfoRow(title: 'Name:  ', value: element.name),
            ElementInfoRow(title: 'Weight:  ', value: element.weight),
            ElementInfoRow(title: 'Category:  ', value: element.category),
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

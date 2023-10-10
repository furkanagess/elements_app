// ignore_for_file: deprecated_member_use

import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/text/element_info_long_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoDetailView extends StatelessWidget {
  final String? descOne;
  final String? descTwo;
  final String? descThree;
  final String? descFour;
  final String? descFive;
  final String? pageSVG;
  final String? title;
  const InfoDetailView({
    super.key,
    required this.descOne,
    required this.descTwo,
    required this.descThree,
    required this.descFour,
    required this.descFive,
    required this.pageSVG,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text(title!),
          ),
        ],
        body: Padding(
          padding: context.paddingNormal,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: context.paddingNormal,
                  child: SvgPicture.asset(
                    pageSVG!,
                    color: Colors.white,
                    height: context.dynamicHeight(0.2),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.darkBlue,
                  ),
                  child: Padding(
                    padding: context.paddingNormal,
                    child: Column(
                      mainAxisSize:
                          MainAxisSize.min, // Column'un boyutunu minimize et
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Description",
                              style: context.textTheme.headlineMedium
                                  ?.copyWith(color: AppColors.white),
                            ),
                            usageParagraph(descOne!),
                            dividerSVG(context),
                            usageParagraph(descTwo!),
                            dividerSVG(context),
                            usageParagraph(descThree!),
                            dividerSVG(context),
                            usageParagraph(descFour!),
                            dividerSVG(context),
                            usageParagraph(descFive!),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dividerSVG(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: SvgPicture.asset(
        pageSVG!,
        color: Colors.white,
        height: context.dynamicHeight(0.035),
      ),
    );
  }

  ElementInfoParagraph usageParagraph(String descTwo) {
    return ElementInfoParagraph(
      title: "",
      paragraph: descTwo,
    );
  }
}

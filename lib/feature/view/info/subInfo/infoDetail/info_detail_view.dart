// ignore_for_file: deprecated_member_use

import 'package:elements_app/feature/model/info.dart';
import 'package:elements_app/feature/provider/localization_provider.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/stringConstants/en_app_strings.dart';
import 'package:elements_app/product/constants/stringConstants/tr_app_strings.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/scaffold/app_scaffold.dart';
import 'package:elements_app/product/widget/text/element_info_long_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class InfoDetailView extends StatelessWidget {
  final Info info;

  const InfoDetailView({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    bool isTr = Provider.of<LocalizationProvider>(context).isTr;
    return AppScaffold(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              title: Text(
                  isTr ? TrAppStrings.description : EnAppStrings.description),
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
                      info.svg!,
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
                                isTr ? info.trTitle! : info.enTitle!,
                                style: context.textTheme.headlineMedium
                                    ?.copyWith(color: AppColors.white),
                              ),
                              usageParagraph(
                                  isTr ? info.trDesc1! : info.enDesc1!),
                              dividerSVG(context),
                              usageParagraph(
                                  isTr ? info.trDesc2! : info.enDesc2!),
                              dividerSVG(context),
                              usageParagraph(
                                  isTr ? info.trDesc3! : info.enDesc3!),
                              dividerSVG(context),
                              usageParagraph(
                                  isTr ? info.trDesc4! : info.enDesc4!),
                              dividerSVG(context),
                              usageParagraph(
                                  isTr ? info.trDesc5! : info.enDesc5!),
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
      ),
    );
  }

  Widget dividerSVG(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: SvgPicture.asset(
        info.svg!,
        color: Colors.white,
        height: context.dynamicHeight(0.035),
      ),
    );
  }

  ElementInfoParagraph usageParagraph(String desc) {
    return ElementInfoParagraph(
      title: EnAppStrings.space,
      paragraph: desc,
    );
  }
}

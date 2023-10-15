// ignore_for_file: deprecated_member_use

import 'package:elements_app/feature/model/info.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/scaffold/app_scaffold.dart';
import 'package:elements_app/product/widget/text/element_info_long_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoDetailView extends StatelessWidget {
  final Info info;

  const InfoDetailView({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(
              title: Text("Description"),
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
                                info.title!,
                                style: context.textTheme.headlineMedium
                                    ?.copyWith(color: AppColors.white),
                              ),
                              usageParagraph(info.desc1!),
                              dividerSVG(context),
                              usageParagraph(info.desc2!),
                              dividerSVG(context),
                              usageParagraph(info.desc3!),
                              dividerSVG(context),
                              usageParagraph(info.desc4!),
                              dividerSVG(context),
                              usageParagraph(info.desc5!),
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

  ElementInfoParagraph usageParagraph(String descTwo) {
    return ElementInfoParagraph(
      title: "",
      paragraph: descTwo,
    );
  }
}

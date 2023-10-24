import 'package:elements_app/feature/model/info.dart';
import 'package:elements_app/feature/provider/localization_provider.dart';
import 'package:elements_app/feature/view/home/info/subInfo/infoDetail/info_detail_view.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/assets_constants.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:elements_app/product/extensions/color_extension.dart';
import 'package:provider/provider.dart';

@immutable
final class WhatIsContainer extends StatelessWidget {
  final Info info;

  const WhatIsContainer({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    bool isTr = Provider.of<LocalizationProvider>(context).isTr;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InfoDetailView(info: info),
          ),
        );
      },
      child: Padding(
        padding: context.paddingNormal,
        child: Container(
          height: context.dynamicHeight(0.075),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: info.shColor?.toColor(),
                offset: const Offset(4, 4),
                spreadRadius: 1,
              ),
            ],
            color: info.colors?.toColor(),
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
                  width: context.dynamicWidth(0.03),
                ),
                Text(
                  isTr ? info.trTitle! : info.enTitle!,
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
      ),
    );
  }
}

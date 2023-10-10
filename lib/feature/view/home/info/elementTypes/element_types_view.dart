import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/stringConstants/app_strings.dart';
import 'package:elements_app/product/constants/assets_constants.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/container/what_is_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ElementTypesView extends StatelessWidget {
  const ElementTypesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        const SliverAppBar(
          title: Text("Element Types"),
        ),
      ],
      body: Padding(
        padding: context.paddingNormalHorizontal,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                sizedBoxSpacer(context),
                WhatIsContainer(
                  title: AppStrings.alkaline,
                  color: AppColors.turquoise,
                  shColor: AppColors.shTurquoise,
                  onTap: () {},
                ),
                sizedBoxSpacer(context),
                WhatIsContainer(
                  title: "Earth Alkaline",
                  color: AppColors.yellow,
                  shColor: AppColors.shYellow,
                  onTap: () {},
                ),
                sizedBoxSpacer(context),
                WhatIsContainer(
                  title: AppStrings.nobleGases,
                  color: AppColors.glowGreen,
                  shColor: AppColors.shGlowGreen,
                  onTap: () {},
                ),
                sizedBoxSpacer(context),
                WhatIsContainer(
                  title: "Reac. Nonmetal",
                  color: AppColors.powderRed,
                  shColor: AppColors.shPowderRed,
                  onTap: () {},
                ),
                sizedBoxSpacer(context),
                WhatIsContainer(
                  title: AppStrings.halogens,
                  color: AppColors.lightGreen,
                  shColor: AppColors.shLightGreen,
                  onTap: () {},
                ),
                sizedBoxSpacer(context),
                WhatIsContainer(
                  title: AppStrings.metalloids,
                  color: AppColors.skinColor,
                  shColor: AppColors.shSkinColor,
                  onTap: () {},
                ),
                sizedBoxSpacer(context),
                WhatIsContainer(
                  title: AppStrings.actinides,
                  color: AppColors.darkTurquoise,
                  shColor: AppColors.shDarkTurquoise,
                  onTap: () {},
                ),
                sizedBoxSpacer(context),
                WhatIsContainer(
                  title: AppStrings.lanthanides,
                  color: AppColors.pink,
                  shColor: AppColors.shPink,
                  onTap: () {},
                ),
                sizedBoxSpacer(context),
                WhatIsContainer(
                  title: AppStrings.unknown,
                  color: AppColors.darkWhite,
                  shColor: AppColors.shDarkWhite,
                  onTap: () {},
                ),
                sizedBoxSpacer(context),
                WhatIsContainer(
                  title: AppStrings.transitionMetal,
                  color: AppColors.purple,
                  shColor: AppColors.shPurple,
                  onTap: () {},
                ),
                sizedBoxSpacer(context),
                WhatIsContainer(
                  title: "Post Transition",
                  color: AppColors.steelBlue,
                  shColor: AppColors.shSteelBlue,
                  onTap: () {},
                ),
                sizedBoxSpacer(context),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  SizedBox sizedBoxSpacer(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.05),
    );
  }
}

class WhatIsInfoContainer extends StatelessWidget {
  const WhatIsInfoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.075),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: AppColors.shYellow,
            offset: Offset(4, 4),
            spreadRadius: 1,
          ),
        ],
        color: AppColors.yellow,
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
              width: context.dynamicWidth(0.05),
            ),
            Text(
              "What is element",
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
    );
  }
}

import 'package:elements_app/feature/view/home/info/infoDetail/info_detail_view.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/stringConstants/app_strings.dart';
import 'package:elements_app/product/constants/assets_constants.dart';
import 'package:elements_app/product/constants/stringConstants/element_type_strings.dart';
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoDetailView(
                          descOne: ElementTypeStrings.alkalineDesc1,
                          descTwo: ElementTypeStrings.alkalineDesc2,
                          descThree: ElementTypeStrings.alkalineDesc3,
                          descFour: ElementTypeStrings.alkalineDesc4,
                          descFive: ElementTypeStrings.alkalineDesc5,
                          title: AppStrings.alkaline,
                          pageSVG: AssetConstants.instance.svgInfoTable,
                        ),
                      ),
                    );
                  },
                ),
                sizedBoxSpacer(context),
                WhatIsContainer(
                  title: "Earth Alkaline",
                  color: AppColors.yellow,
                  shColor: AppColors.shYellow,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoDetailView(
                          descOne: ElementTypeStrings.earthAlkalineDesc1,
                          descTwo: ElementTypeStrings.earthAlkalineDesc2,
                          descThree: ElementTypeStrings.earthAlkalineDesc3,
                          descFour: ElementTypeStrings.earthAlkalineDesc4,
                          descFive: ElementTypeStrings.earthAlkalineDesc5,
                          title: AppStrings.earthAlkaline,
                          pageSVG: AssetConstants.instance.svgInfoTable,
                        ),
                      ),
                    );
                  },
                ),
                sizedBoxSpacer(context),
                WhatIsContainer(
                  title: AppStrings.nobleGases,
                  color: AppColors.glowGreen,
                  shColor: AppColors.shGlowGreen,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoDetailView(
                          descOne: ElementTypeStrings.nobleGasesDesc1,
                          descTwo: ElementTypeStrings.nobleGasesDesc2,
                          descThree: ElementTypeStrings.nobleGasesDesc3,
                          descFour: ElementTypeStrings.nobleGasesDesc4,
                          descFive: ElementTypeStrings.nobleGasesDesc5,
                          title: AppStrings.nobleGases,
                          pageSVG: AssetConstants.instance.svgInfoTable,
                        ),
                      ),
                    );
                  },
                ),
                sizedBoxSpacer(context),
                WhatIsContainer(
                  title: "Reac. Nonmetal",
                  color: AppColors.powderRed,
                  shColor: AppColors.shPowderRed,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoDetailView(
                          descOne: ElementTypeStrings.reactiveDesc1,
                          descTwo: ElementTypeStrings.reactiveDesc2,
                          descThree: ElementTypeStrings.reactiveDesc3,
                          descFour: ElementTypeStrings.reactiveDesc4,
                          descFive: ElementTypeStrings.reactiveDesc5,
                          title: AppStrings.reactiveNonmetal,
                          pageSVG: AssetConstants.instance.svgInfoTable,
                        ),
                      ),
                    );
                  },
                ),
                sizedBoxSpacer(context),
                WhatIsContainer(
                  title: AppStrings.halogens,
                  color: AppColors.lightGreen,
                  shColor: AppColors.shLightGreen,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoDetailView(
                          descOne: ElementTypeStrings.halogenDesc1,
                          descTwo: ElementTypeStrings.halogenDesc2,
                          descThree: ElementTypeStrings.halogenDesc3,
                          descFour: ElementTypeStrings.halogenDesc4,
                          descFive: ElementTypeStrings.halogenDesc5,
                          title: AppStrings.halogens,
                          pageSVG: AssetConstants.instance.svgInfoTable,
                        ),
                      ),
                    );
                  },
                ),
                sizedBoxSpacer(context),
                WhatIsContainer(
                  title: AppStrings.metalloids,
                  color: AppColors.skinColor,
                  shColor: AppColors.shSkinColor,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoDetailView(
                          descOne: ElementTypeStrings.metalloidDesc1,
                          descTwo: ElementTypeStrings.metalloidDesc2,
                          descThree: ElementTypeStrings.metalloidDesc3,
                          descFour: ElementTypeStrings.metalloidDesc4,
                          descFive: ElementTypeStrings.metalloidDesc5,
                          title: AppStrings.metalloids,
                          pageSVG: AssetConstants.instance.svgInfoTable,
                        ),
                      ),
                    );
                  },
                ),
                sizedBoxSpacer(context),
                WhatIsContainer(
                  title: AppStrings.actinides,
                  color: AppColors.darkTurquoise,
                  shColor: AppColors.shDarkTurquoise,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoDetailView(
                          descOne: ElementTypeStrings.actinidesDesc1,
                          descTwo: ElementTypeStrings.actinidesDesc2,
                          descThree: ElementTypeStrings.actinidesDesc3,
                          descFour: ElementTypeStrings.actinidesDesc4,
                          descFive: ElementTypeStrings.actinidesDesc5,
                          title: AppStrings.actinides,
                          pageSVG: AssetConstants.instance.svgInfoTable,
                        ),
                      ),
                    );
                  },
                ),
                sizedBoxSpacer(context),
                WhatIsContainer(
                  title: AppStrings.lanthanides,
                  color: AppColors.pink,
                  shColor: AppColors.shPink,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoDetailView(
                          descOne: ElementTypeStrings.lanthanideDesc1,
                          descTwo: ElementTypeStrings.lanthanideDesc2,
                          descThree: ElementTypeStrings.lanthanideDesc3,
                          descFour: ElementTypeStrings.lanthanideDesc4,
                          descFive: ElementTypeStrings.lanthanideDesc5,
                          title: AppStrings.lanthanides,
                          pageSVG: AssetConstants.instance.svgInfoTable,
                        ),
                      ),
                    );
                  },
                ),
                sizedBoxSpacer(context),
                WhatIsContainer(
                  title: AppStrings.transitionMetal,
                  color: AppColors.purple,
                  shColor: AppColors.shPurple,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoDetailView(
                          descOne: ElementTypeStrings.transitionDesc1,
                          descTwo: ElementTypeStrings.transitionDesc2,
                          descThree: ElementTypeStrings.transitionDesc3,
                          descFour: ElementTypeStrings.transitionDesc4,
                          descFive: ElementTypeStrings.transitionDesc5,
                          title: AppStrings.transitionMetal,
                          pageSVG: AssetConstants.instance.svgInfoTable,
                        ),
                      ),
                    );
                  },
                ),
                sizedBoxSpacer(context),
                WhatIsContainer(
                  title: "Post Transition",
                  color: AppColors.steelBlue,
                  shColor: AppColors.shSteelBlue,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoDetailView(
                          descOne: ElementTypeStrings.postTransitionDesc1,
                          descTwo: ElementTypeStrings.postTransitionDesc2,
                          descThree: ElementTypeStrings.postTransitionDesc3,
                          descFour: ElementTypeStrings.postTransitionDesc4,
                          descFive: ElementTypeStrings.postTransitionDesc5,
                          title: AppStrings.postTransition,
                          pageSVG: AssetConstants.instance.svgInfoTable,
                        ),
                      ),
                    );
                  },
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

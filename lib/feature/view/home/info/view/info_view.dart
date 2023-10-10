import 'package:elements_app/feature/view/home/info/elementTypes/element_types_view.dart';
import 'package:elements_app/feature/view/home/info/infoDetail/info_detail_view.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/assets_constants.dart';
import 'package:elements_app/product/constants/stringConstants/info_strings.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/container/what_is_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WhatIsView extends StatelessWidget {
  const WhatIsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("What Is"),
      ),
      body: Center(
        child: Padding(
          padding: context.paddingNormalHorizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WhatIsContainer(
                title: "Element",
                color: AppColors.glowGreen,
                shColor: AppColors.shGlowGreen,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoDetailView(
                        descOne: InfoStrings.elementDesc1,
                        descTwo: InfoStrings.elementDesc2,
                        descThree: InfoStrings.elementDesc3,
                        descFour: InfoStrings.elementDesc4,
                        descFive: InfoStrings.elementDesc5,
                        title: "Element",
                        pageSVG: AssetConstants.instance.svgScienceTwo,
                      ),
                    ),
                  );
                },
              ),
              WhatIsContainer(
                title: "Element Types",
                color: AppColors.turquoise,
                shColor: AppColors.shTurquoise,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ElementTypesView(),
                    ),
                  );
                },
              ),
              WhatIsContainer(
                title: "Periodic Table",
                color: AppColors.darkWhite,
                shColor: AppColors.shDarkWhite,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoDetailView(
                        descOne: InfoStrings.tableDesc1,
                        descTwo: InfoStrings.tableDesc2,
                        descThree: InfoStrings.tableDesc3,
                        descFour: InfoStrings.tableDesc4,
                        descFive: InfoStrings.tableDesc5,
                        title: "Periodic Table",
                        pageSVG: AssetConstants.instance.svgInfoTable,
                      ),
                    ),
                  );
                },
              ),
              WhatIsContainer(
                title: "Group",
                color: AppColors.purple,
                shColor: AppColors.shPurple,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoDetailView(
                        descOne: InfoStrings.groupDesc1,
                        descTwo: InfoStrings.groupDesc2,
                        descThree: InfoStrings.groupDesc3,
                        descFour: InfoStrings.groupDesc4,
                        descFive: InfoStrings.groupDesc5,
                        title: "Group",
                        pageSVG: AssetConstants.instance.svgGroup,
                      ),
                    ),
                  );
                },
              ),
              WhatIsContainer(
                title: "Period",
                color: AppColors.powderRed,
                shColor: AppColors.shPowderRed,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoDetailView(
                        descOne: InfoStrings.periodDesc1,
                        descTwo: InfoStrings.periodDesc2,
                        descThree: InfoStrings.periodDesc3,
                        descFour: InfoStrings.periodDesc4,
                        descFive: InfoStrings.periodDesc5,
                        title: "Period",
                        pageSVG: AssetConstants.instance.svgPeriod,
                      ),
                    ),
                  );
                },
              ),
              WhatIsContainer(
                title: "Block",
                color: AppColors.darkTurquoise,
                shColor: AppColors.shDarkTurquoise,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoDetailView(
                        descOne: InfoStrings.blockDesc1,
                        descTwo: InfoStrings.blockDesc2,
                        descThree: InfoStrings.blockDesc3,
                        descFour: InfoStrings.blockDesc4,
                        descFive: InfoStrings.blockDesc5,
                        title: "Period",
                        pageSVG: AssetConstants.instance.svgBlock,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
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

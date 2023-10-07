import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/assets_constants.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WhatIsView extends StatelessWidget {
  const WhatIsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: context.paddingNormalHorizontal,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WhatIsInfoContainer(),
              WhatIsInfoContainer(),
              WhatIsInfoContainer(),
              WhatIsInfoContainer(),
              WhatIsInfoContainer(),
              WhatIsInfoContainer(),
              WhatIsInfoContainer(),
              WhatIsInfoContainer(),
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

import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/container/element_group_container.dart';
import 'package:flutter/material.dart';

class ElementGroupsView extends StatelessWidget {
  const ElementGroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElementGroupContainer(
                  color: AppColors.pink,
                  shadowColor: AppColors.shPink,
                  onTap: () {},
                  title: "Aktinitler",
                ),
                ElementGroupContainer(
                  color: AppColors.turquoise,
                  shadowColor: AppColors.shTurquoise,
                  onTap: () {},
                  title: "Alkali Metaller",
                ),
              ],
            ),
            spacer(context, 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElementGroupContainer(
                  color: AppColors.yellow,
                  shadowColor: AppColors.shYellow,
                  onTap: () {},
                  title: "Toprak Alkali Metaller",
                ),
                ElementGroupContainer(
                  color: AppColors.lightGreen,
                  shadowColor: AppColors.shLightGreen,
                  onTap: () {},
                  title: "Halojenler",
                ),
              ],
            ),
            spacer(context, 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElementGroupContainer(
                  color: AppColors.skinColor,
                  shadowColor: AppColors.shSkinColor,
                  onTap: () {},
                  title: "Metalimsiler",
                ),
                ElementGroupContainer(
                  color: AppColors.glowGreen,
                  shadowColor: AppColors.shGlowGreen,
                  onTap: () {},
                  title: "Soy Gazlar",
                ),
              ],
            ),
            spacer(context, 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElementGroupContainer(
                  color: AppColors.steelBlue,
                  shadowColor: AppColors.shSteelBlue,
                  onTap: () {},
                  title: "Geçiş Sonrası Metaller",
                ),
                ElementGroupContainer(
                  color: AppColors.powderRed,
                  shadowColor: AppColors.shPowderRed,
                  onTap: () {},
                  title: "Reaktif Ametaller",
                ),
              ],
            ),
            spacer(context, 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElementGroupContainer(
                  color: AppColors.purple,
                  shadowColor: AppColors.shPurple,
                  onTap: () {},
                  title: "Geçiş Metaller",
                ),
                ElementGroupContainer(
                  color: AppColors.darkWhite,
                  shadowColor: AppColors.shDarkWhite,
                  onTap: () {},
                  title: "Bilinmeyenler",
                ),
              ],
            ),
            spacer(context, 0.05),
          ],
        ),
      ),
    );
  }

  SizedBox spacer(BuildContext context, double value) =>
      SizedBox(height: context.dynamicHeight(value));
}

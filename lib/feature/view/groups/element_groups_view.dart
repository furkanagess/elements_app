import 'package:elements_app/feature/view/elements/view/elements_list_view.dart';
import 'package:elements_app/product/constants/api_types.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/app_strings.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/container/element_group_container.dart';
import 'package:flutter/material.dart';

class ElementGroupsView extends StatelessWidget {
  const ElementGroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ElementsListView(
                          apiType: ApiTypes.actinides,
                          title: AppStrings.actinides,
                        ),
                      ),
                    );
                  },
                  title: AppStrings.actinides,
                ),
                ElementGroupContainer(
                  color: AppColors.turquoise,
                  shadowColor: AppColors.shTurquoise,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ElementsListView(
                          apiType: ApiTypes.alkaliMetal,
                          title: AppStrings.alkaline,
                        ),
                      ),
                    );
                  },
                  title: AppStrings.alkaline,
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ElementsListView(
                          apiType: ApiTypes.alkalineEarthMetal,
                          title: AppStrings.earthAlkaline,
                        ),
                      ),
                    );
                  },
                  title: AppStrings.earthAlkaline,
                ),
                ElementGroupContainer(
                  color: AppColors.lightGreen,
                  shadowColor: AppColors.shLightGreen,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ElementsListView(
                          apiType: ApiTypes.halogen,
                          title: AppStrings.halogens,
                        ),
                      ),
                    );
                  },
                  title: AppStrings.halogens,
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ElementsListView(
                          apiType: ApiTypes.metalloid,
                          title: AppStrings.metalloids,
                        ),
                      ),
                    );
                  },
                  title: AppStrings.metalloids,
                ),
                ElementGroupContainer(
                  color: AppColors.glowGreen,
                  shadowColor: AppColors.shGlowGreen,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ElementsListView(
                          apiType: ApiTypes.nobleGases,
                          title: AppStrings.nobleGases,
                        ),
                      ),
                    );
                  },
                  title: AppStrings.nobleGases,
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ElementsListView(
                          apiType: ApiTypes.postTransition,
                          title: AppStrings.postTransition,
                        ),
                      ),
                    );
                  },
                  title: AppStrings.postTransition,
                ),
                ElementGroupContainer(
                  color: AppColors.powderRed,
                  shadowColor: AppColors.shPowderRed,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ElementsListView(
                          apiType: ApiTypes.reactiveNonmetal,
                          title: AppStrings.reactiveNonmetal,
                        ),
                      ),
                    );
                  },
                  title: AppStrings.reactiveNonmetal,
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ElementsListView(
                          apiType: ApiTypes.transitionMetal,
                          title: AppStrings.transitionMetal,
                        ),
                      ),
                    );
                  },
                  title: AppStrings.transitionMetal,
                ),
                ElementGroupContainer(
                  color: AppColors.darkWhite,
                  shadowColor: AppColors.shDarkWhite,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ElementsListView(
                          apiType: ApiTypes.unknown,
                          title: AppStrings.unknown,
                        ),
                      ),
                    );
                  },
                  title: AppStrings.unknown,
                ),
              ],
            ),
            spacer(context, 0.05),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text("Element Grupları"),
    );
  }

  SizedBox spacer(BuildContext context, double value) =>
      SizedBox(height: context.dynamicHeight(value));
}

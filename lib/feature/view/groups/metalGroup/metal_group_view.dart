import 'package:elements_app/feature/view/elementsList/view/elements_list_view.dart';
import 'package:elements_app/product/constants/api_types.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/app_strings.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/container/element_group_container.dart';
import 'package:flutter/material.dart';

class MetalGroupView extends StatelessWidget {
  const MetalGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          spacer(context, 0.02),
          transitionsMetalsRow(context),
          alkalineMetalsRow(context),
          otherMetalsRow(context),
          spacer(context, 0.04),
        ],
      ),
    );
  }

  Row otherMetalsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        lanthanidesContainer(context),
        actinidesContainer(context),
      ],
    );
  }

  Row alkalineMetalsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        alkalineEarthMetalContainer(context),
        alkalineMetalContainer(context),
      ],
    );
  }

  Row transitionsMetalsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        postTransitionContainer(context),
        transitionMetalContainer(context),
      ],
    );
  }

  ElementGroupContainer actinidesContainer(BuildContext context) {
    return ElementGroupContainer(
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
    );
  }

  ElementGroupContainer lanthanidesContainer(BuildContext context) {
    return ElementGroupContainer(
      color: AppColors.darkTurquoise,
      shadowColor: AppColors.shDarkTurquoise,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ElementsListView(
              apiType: ApiTypes.lanthanides,
              title: AppStrings.lanthanides,
            ),
          ),
        );
      },
      title: AppStrings.lanthanides,
    );
  }

  ElementGroupContainer alkalineMetalContainer(BuildContext context) {
    return ElementGroupContainer(
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
    );
  }

  ElementGroupContainer alkalineEarthMetalContainer(BuildContext context) {
    return ElementGroupContainer(
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
    );
  }

  ElementGroupContainer transitionMetalContainer(BuildContext context) {
    return ElementGroupContainer(
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
    );
  }

  ElementGroupContainer postTransitionContainer(BuildContext context) {
    return ElementGroupContainer(
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
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(AppStrings.metalGroups),
    );
  }

  SizedBox spacer(BuildContext context, double value) =>
      SizedBox(height: context.dynamicHeight(value));
}

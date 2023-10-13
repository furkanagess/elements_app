import 'package:elements_app/feature/view/elementsList/elements_list_view.dart';
import 'package:elements_app/feature/view/home/groups/metalGroup/metal_group_view.dart';
import 'package:elements_app/feature/view/home/groups/nonMetalGroup/non_metal_group_view.dart';
import 'package:elements_app/product/constants/api_types.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/stringConstants/app_strings.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/container/element_group_container.dart';
import 'package:flutter/material.dart';

class ElementGroupView extends StatelessWidget {
  const ElementGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddingLowHorizontal,
          child: Column(
            children: [
              spacer(context, 0.05),
              metalAndNonmetalRow(context),
              spacer(context, 0.05),
              metalloidAndUnknownRow(context),
              spacer(context, 0.05),
              unknownGroupContainer(context),
            ],
          ),
        ),
      ),
    );
  }

  ElementGroupContainer halogenContainer(BuildContext context) {
    return ElementGroupContainer(
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
      title: AppStrings.halogenGroup,
    );
  }

  Row metalloidAndUnknownRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        metalloidGroupContainer(context),
        halogenContainer(context),
      ],
    );
  }

  Row metalAndNonmetalRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        metalGroupContainer(context),
        nonmetalGroupContainer(context),
      ],
    );
  }

  ElementGroupContainer metalGroupContainer(BuildContext context) {
    return ElementGroupContainer(
      color: AppColors.purple,
      shadowColor: AppColors.shPurple,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MetalGroupView(),
          ),
        );
      },
      title: AppStrings.metalGroups,
    );
  }

  ElementGroupContainer nonmetalGroupContainer(BuildContext context) {
    return ElementGroupContainer(
      color: AppColors.powderRed,
      shadowColor: AppColors.shPowderRed,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NonMetalGroupView(),
          ),
        );
      },
      title: AppStrings.nonMetalGroup,
    );
  }

  ElementGroupContainer metalloidGroupContainer(BuildContext context) {
    return ElementGroupContainer(
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
      title: AppStrings.metalloidGroup,
    );
  }

  ElementGroupContainer unknownGroupContainer(BuildContext context) {
    return ElementGroupContainer(
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
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        AppStrings.elementGroups,
      ),
    );
  }

  SizedBox spacer(BuildContext context, double value) =>
      SizedBox(height: context.dynamicHeight(value));
}

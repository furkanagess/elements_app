import 'package:elements_app/feature/provider/localization_provider.dart';
import 'package:elements_app/feature/view/elementsList/elements_list_view.dart';
import 'package:elements_app/feature/view/groups/metalGroup/metal_group_view.dart';
import 'package:elements_app/feature/view/groups/nonMetalGroup/non_metal_group_view.dart';
import 'package:elements_app/product/constants/api_types.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/stringConstants/en_app_strings.dart';
import 'package:elements_app/product/constants/stringConstants/tr_app_strings.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/container/element_group_container.dart';
import 'package:elements_app/product/widget/scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ElementGroupView extends StatelessWidget {
  const ElementGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTr = Provider.of<LocalizationProvider>(context).isTr;
    return AppScaffold(
      child: Scaffold(
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: context.paddingLowHorizontal,
            child: Column(
              children: [
                spacer(context, 0.05),
                metalAndNonmetalRow(context, isTr),
                spacer(context, 0.05),
                metalloidAndUnknownRow(context, isTr),
                spacer(context, 0.05),
                unknownGroupContainer(context, isTr),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElementGroupContainer halogenContainer(BuildContext context, bool isTr) {
    return ElementGroupContainer(
      color: AppColors.lightGreen,
      shadowColor: AppColors.shLightGreen,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ElementsListView(
              apiType: ApiTypes.halogen,
              title: isTr ? TrAppStrings.halogenGroups : EnAppStrings.halogens,
            ),
          ),
        );
      },
      title: isTr ? TrAppStrings.halogenGroups : EnAppStrings.halogenGroup,
    );
  }

  Row metalloidAndUnknownRow(BuildContext context, bool isTr) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        metalloidGroupContainer(context, isTr),
        halogenContainer(context, isTr),
      ],
    );
  }

  Row metalAndNonmetalRow(BuildContext context, bool isTr) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        metalGroupContainer(context, isTr),
        nonmetalGroupContainer(context, isTr),
      ],
    );
  }

  ElementGroupContainer metalGroupContainer(BuildContext context, bool isTr) {
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
      title: isTr ? TrAppStrings.metalGroups : EnAppStrings.metalGroups,
    );
  }

  ElementGroupContainer nonmetalGroupContainer(
      BuildContext context, bool isTr) {
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
      title: isTr ? TrAppStrings.nonMetalGroups : EnAppStrings.nonMetalGroup,
    );
  }

  ElementGroupContainer metalloidGroupContainer(
      BuildContext context, bool isTr) {
    return ElementGroupContainer(
      color: AppColors.skinColor,
      shadowColor: AppColors.shSkinColor,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ElementsListView(
              apiType: ApiTypes.metalloid,
              title: isTr ? TrAppStrings.metalloids : EnAppStrings.metalloids,
            ),
          ),
        );
      },
      title: isTr ? TrAppStrings.metalloidGroups : EnAppStrings.metalloidGroup,
    );
  }

  ElementGroupContainer unknownGroupContainer(BuildContext context, bool isTr) {
    return ElementGroupContainer(
      color: AppColors.darkWhite,
      shadowColor: AppColors.shDarkWhite,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ElementsListView(
              apiType: ApiTypes.unknown,
              title: isTr ? TrAppStrings.unknown : EnAppStrings.unknown,
            ),
          ),
        );
      },
      title: isTr ? TrAppStrings.unknown : EnAppStrings.unknown,
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        EnAppStrings.elementGroups,
      ),
    );
  }

  SizedBox spacer(BuildContext context, double value) =>
      SizedBox(height: context.dynamicHeight(value));
}

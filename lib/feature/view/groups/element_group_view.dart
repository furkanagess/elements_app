import 'package:elements_app/feature/provider/admob_provider.dart';
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
    return AppScaffold(
      child: Scaffold(
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
      ),
    );
  }

  ElementGroupContainer halogenContainer(BuildContext context) {
    return ElementGroupContainer(
      color: AppColors.lightGreen,
      shadowColor: AppColors.shLightGreen,
      onTap: () {
        context.read<AdmobProvider>().createAndShowInterstitialAd();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ElementsListView(
              apiType: ApiTypes.halogen,
              title: context.read<LocalizationProvider>().isTr
                  ? TrAppStrings.halogenGroups
                  : EnAppStrings.halogens,
            ),
          ),
        );
      },
      title: context.read<LocalizationProvider>().isTr
          ? TrAppStrings.halogenGroups
          : EnAppStrings.halogenGroup,
    );
  }

  Row metalloidAndUnknownRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        metalloidGroupContainer(context),
        halogenContainer(
          context,
        ),
      ],
    );
  }

  Row metalAndNonmetalRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        metalGroupContainer(
          context,
        ),
        nonmetalGroupContainer(
          context,
        ),
      ],
    );
  }

  ElementGroupContainer metalGroupContainer(BuildContext context) {
    return ElementGroupContainer(
      color: AppColors.purple,
      shadowColor: AppColors.shPurple,
      onTap: () {
        context.read<AdmobProvider>().createAndShowInterstitialAd();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MetalGroupView(),
          ),
        );
      },
      title: context.read<LocalizationProvider>().isTr
          ? TrAppStrings.metalGroups
          : EnAppStrings.metalGroups,
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
      title: context.read<LocalizationProvider>().isTr
          ? TrAppStrings.nonMetalGroups
          : EnAppStrings.nonMetalGroup,
    );
  }

  ElementGroupContainer metalloidGroupContainer(BuildContext context) {
    return ElementGroupContainer(
      color: AppColors.skinColor,
      shadowColor: AppColors.shSkinColor,
      onTap: () {
        context.read<AdmobProvider>().createAndShowInterstitialAd();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ElementsListView(
              apiType: ApiTypes.metalloid,
              title: context.read<LocalizationProvider>().isTr
                  ? TrAppStrings.metalloids
                  : EnAppStrings.metalloids,
            ),
          ),
        );
      },
      title: context.read<LocalizationProvider>().isTr
          ? TrAppStrings.metalloidGroups
          : EnAppStrings.metalloidGroup,
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
            builder: (context) => ElementsListView(
              apiType: ApiTypes.unknown,
              title: context.read<LocalizationProvider>().isTr
                  ? TrAppStrings.unknown
                  : EnAppStrings.unknown,
            ),
          ),
        );
      },
      title: context.read<LocalizationProvider>().isTr
          ? TrAppStrings.unknown
          : EnAppStrings.unknown,
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

import 'package:elements_app/feature/provider/admob_provider.dart';
import 'package:elements_app/feature/provider/localization_provider.dart';
import 'package:elements_app/feature/view/elementsList/elements_list_view.dart';
import 'package:elements_app/product/constants/api_types.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/stringConstants/en_app_strings.dart';
import 'package:elements_app/product/constants/stringConstants/tr_app_strings.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/container/element_group_container.dart';
import 'package:elements_app/product/widget/scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MetalGroupView extends StatelessWidget {
  const MetalGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        appBar: appBar(context),
        body: Padding(
          padding: context.paddingLowHorizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              spacer(context, 0.02),
              transitionsMetalsRow(context),
              alkalineMetalsRow(context),
              otherMetalsRow(context),
              spacer(context, 0.04),
            ],
          ),
        ),
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
        context.read<AdmobProvider>().createAndShowInterstitialAd();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ElementsListView(
              apiType: ApiTypes.actinides,
              title: context.read<LocalizationProvider>().isTr
                  ? TrAppStrings.actinides
                  : EnAppStrings.actinides,
            ),
          ),
        );
      },
      title: context.read<LocalizationProvider>().isTr
          ? TrAppStrings.actinides
          : EnAppStrings.actinides,
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
            builder: (context) => ElementsListView(
              apiType: ApiTypes.lanthanides,
              title: context.read<LocalizationProvider>().isTr
                  ? TrAppStrings.lanthanides
                  : EnAppStrings.lanthanides,
            ),
          ),
        );
      },
      title: context.read<LocalizationProvider>().isTr
          ? TrAppStrings.lanthanides
          : EnAppStrings.lanthanides,
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
            builder: (context) => ElementsListView(
              apiType: ApiTypes.alkaliMetal,
              title: context.read<LocalizationProvider>().isTr
                  ? TrAppStrings.alkaline
                  : EnAppStrings.alkaline,
            ),
          ),
        );
      },
      title: context.read<LocalizationProvider>().isTr
          ? TrAppStrings.alkaline
          : EnAppStrings.alkaline,
    );
  }

  ElementGroupContainer alkalineEarthMetalContainer(BuildContext context) {
    return ElementGroupContainer(
      color: AppColors.yellow,
      shadowColor: AppColors.shYellow,
      onTap: () {
        context.read<AdmobProvider>().createAndShowInterstitialAd();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ElementsListView(
              apiType: ApiTypes.alkalineEarthMetal,
              title: context.read<LocalizationProvider>().isTr
                  ? TrAppStrings.earthAlkaline
                  : EnAppStrings.earthAlkaline,
            ),
          ),
        );
      },
      title: context.read<LocalizationProvider>().isTr
          ? TrAppStrings.earthAlkaline
          : EnAppStrings.earthAlkaline,
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
            builder: (context) => ElementsListView(
              apiType: ApiTypes.transitionMetal,
              title: context.read<LocalizationProvider>().isTr
                  ? TrAppStrings.transitionMetal
                  : EnAppStrings.transitionMetal,
            ),
          ),
        );
      },
      title: context.read<LocalizationProvider>().isTr
          ? TrAppStrings.transitionMetal
          : EnAppStrings.transitionMetal,
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
            builder: (context) => ElementsListView(
              apiType: ApiTypes.postTransition,
              title: context.read<LocalizationProvider>().isTr
                  ? TrAppStrings.postTransition
                  : EnAppStrings.postTransition,
            ),
          ),
        );
      },
      title: context.read<LocalizationProvider>().isTr
          ? TrAppStrings.postTransition
          : EnAppStrings.postTransition,
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text(context.read<LocalizationProvider>().isTr
          ? TrAppStrings.metalGroups
          : EnAppStrings.metalGroups),
    );
  }

  SizedBox spacer(BuildContext context, double value) =>
      SizedBox(height: context.dynamicHeight(value));
}

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
    final admobProvider = Provider.of<AdmobProvider>(context);

    bool isTr = Provider.of<LocalizationProvider>(context).isTr;
    return AppScaffold(
      child: Scaffold(
        appBar: appBar(isTr),
        body: Padding(
          padding: context.paddingLowHorizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              spacer(context, 0.02),
              transitionsMetalsRow(context, isTr),
              alkalineMetalsRow(context, isTr, admobProvider),
              otherMetalsRow(context, isTr, admobProvider),
              spacer(context, 0.04),
            ],
          ),
        ),
      ),
    );
  }

  Row otherMetalsRow(
      BuildContext context, bool isTr, AdmobProvider admobProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        lanthanidesContainer(context, isTr),
        actinidesContainer(context, isTr, admobProvider),
      ],
    );
  }

  Row alkalineMetalsRow(
      BuildContext context, bool isTr, AdmobProvider admobProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        alkalineEarthMetalContainer(context, isTr, admobProvider),
        alkalineMetalContainer(context, isTr),
      ],
    );
  }

  Row transitionsMetalsRow(BuildContext context, bool isTr) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        postTransitionContainer(context, isTr),
        transitionMetalContainer(context, isTr),
      ],
    );
  }

  ElementGroupContainer actinidesContainer(
      BuildContext context, bool isTr, AdmobProvider admobProvider) {
    return ElementGroupContainer(
      color: AppColors.pink,
      shadowColor: AppColors.shPink,
      onTap: () {
        admobProvider.createAndShowInterstitialAd();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ElementsListView(
              apiType: ApiTypes.actinides,
              title: isTr ? TrAppStrings.actinides : EnAppStrings.actinides,
            ),
          ),
        );
      },
      title: isTr ? TrAppStrings.actinides : EnAppStrings.actinides,
    );
  }

  ElementGroupContainer lanthanidesContainer(BuildContext context, bool isTr) {
    return ElementGroupContainer(
      color: AppColors.darkTurquoise,
      shadowColor: AppColors.shDarkTurquoise,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ElementsListView(
              apiType: ApiTypes.lanthanides,
              title: isTr ? TrAppStrings.lanthanides : EnAppStrings.lanthanides,
            ),
          ),
        );
      },
      title: isTr ? TrAppStrings.lanthanides : EnAppStrings.lanthanides,
    );
  }

  ElementGroupContainer alkalineMetalContainer(
      BuildContext context, bool isTr) {
    return ElementGroupContainer(
      color: AppColors.turquoise,
      shadowColor: AppColors.shTurquoise,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ElementsListView(
              apiType: ApiTypes.alkaliMetal,
              title: isTr ? TrAppStrings.alkaline : EnAppStrings.alkaline,
            ),
          ),
        );
      },
      title: isTr ? TrAppStrings.alkaline : EnAppStrings.alkaline,
    );
  }

  ElementGroupContainer alkalineEarthMetalContainer(
      BuildContext context, bool isTr, AdmobProvider admobProvider) {
    return ElementGroupContainer(
      color: AppColors.yellow,
      shadowColor: AppColors.shYellow,
      onTap: () {
        admobProvider.createAndShowInterstitialAd();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ElementsListView(
              apiType: ApiTypes.alkalineEarthMetal,
              title: isTr
                  ? TrAppStrings.earthAlkaline
                  : EnAppStrings.earthAlkaline,
            ),
          ),
        );
      },
      title: isTr ? TrAppStrings.earthAlkaline : EnAppStrings.earthAlkaline,
    );
  }

  ElementGroupContainer transitionMetalContainer(
      BuildContext context, bool isTr) {
    return ElementGroupContainer(
      color: AppColors.purple,
      shadowColor: AppColors.shPurple,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ElementsListView(
              apiType: ApiTypes.transitionMetal,
              title: isTr
                  ? TrAppStrings.transitionMetal
                  : EnAppStrings.transitionMetal,
            ),
          ),
        );
      },
      title: isTr ? TrAppStrings.transitionMetal : EnAppStrings.transitionMetal,
    );
  }

  ElementGroupContainer postTransitionContainer(
      BuildContext context, bool isTr) {
    return ElementGroupContainer(
      color: AppColors.steelBlue,
      shadowColor: AppColors.shSteelBlue,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ElementsListView(
              apiType: ApiTypes.postTransition,
              title: isTr
                  ? TrAppStrings.postTransition
                  : EnAppStrings.postTransition,
            ),
          ),
        );
      },
      title: isTr ? TrAppStrings.postTransition : EnAppStrings.postTransition,
    );
  }

  AppBar appBar(bool isTr) {
    return AppBar(
      title: Text(isTr ? TrAppStrings.metalGroups : EnAppStrings.metalGroups),
    );
  }

  SizedBox spacer(BuildContext context, double value) =>
      SizedBox(height: context.dynamicHeight(value));
}

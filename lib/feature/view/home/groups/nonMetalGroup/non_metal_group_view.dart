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

class NonMetalGroupView extends StatelessWidget {
  const NonMetalGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTr = Provider.of<LocalizationProvider>(context).isTr;
    return AppScaffold(
      child: Scaffold(
        appBar: appBar(isTr),
        body: Padding(
          padding: context.paddingLowHorizontal,
          child: Column(
            children: [
              spacer(context, 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  reactiveNonmetalContainer(context, isTr),
                  nobleGasesContainer(context, isTr),
                ],
              ),
              spacer(context, 0.05),
            ],
          ),
        ),
      ),
    );
  }

  ElementGroupContainer nobleGasesContainer(BuildContext context, bool isTr) {
    return ElementGroupContainer(
      color: AppColors.glowGreen,
      shadowColor: AppColors.shGlowGreen,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ElementsListView(
              apiType: ApiTypes.nobleGases,
              title: isTr ? TrAppStrings.nobleGases : EnAppStrings.nobleGases,
            ),
          ),
        );
      },
      title: isTr ? TrAppStrings.nobleGases : EnAppStrings.nobleGases,
    );
  }

  ElementGroupContainer reactiveNonmetalContainer(
      BuildContext context, bool isTr) {
    return ElementGroupContainer(
      color: AppColors.powderRed,
      shadowColor: AppColors.shPowderRed,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ElementsListView(
              apiType: ApiTypes.reactiveNonmetal,
              title: isTr
                  ? TrAppStrings.reactiveNonmetal
                  : EnAppStrings.reactiveNonmetal,
            ),
          ),
        );
      },
      title:
          isTr ? TrAppStrings.reactiveNonmetal : EnAppStrings.reactiveNonmetal,
    );
  }

  AppBar appBar(isTr) {
    return AppBar(
      title:
          Text(isTr ? TrAppStrings.nonMetalGroups : EnAppStrings.nonMetalGroup),
    );
  }

  SizedBox spacer(BuildContext context, double value) =>
      SizedBox(height: context.dynamicHeight(value));
}

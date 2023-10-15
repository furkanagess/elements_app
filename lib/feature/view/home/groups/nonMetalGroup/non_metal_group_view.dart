import 'package:elements_app/feature/view/elementsList/elements_list_view.dart';
import 'package:elements_app/product/constants/api_types.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/stringConstants/app_strings.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/container/element_group_container.dart';
import 'package:elements_app/product/widget/scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';

class NonMetalGroupView extends StatelessWidget {
  const NonMetalGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        appBar: appBar(),
        body: Padding(
          padding: context.paddingLowHorizontal,
          child: Column(
            children: [
              spacer(context, 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  reactiveNonmetalContainer(context),
                  nobleGasesContainer(context),
                ],
              ),
              spacer(context, 0.05),
            ],
          ),
        ),
      ),
    );
  }

  ElementGroupContainer nobleGasesContainer(BuildContext context) {
    return ElementGroupContainer(
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
    );
  }

  ElementGroupContainer reactiveNonmetalContainer(BuildContext context) {
    return ElementGroupContainer(
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
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(AppStrings.nonMetalGroup),
    );
  }

  SizedBox spacer(BuildContext context, double value) =>
      SizedBox(height: context.dynamicHeight(value));
}

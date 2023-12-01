import 'package:elements_app/feature/model/info.dart';
import 'package:elements_app/feature/provider/admob_provider.dart';
import 'package:elements_app/feature/provider/localization_provider.dart';
import 'package:elements_app/feature/view/info/subInfo/elementType/element_type_view.dart';
import 'package:elements_app/feature/mixin/info/info_mixin.dart';
import 'package:elements_app/product/constants/api_types.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/assets_constants.dart';
import 'package:elements_app/product/constants/stringConstants/en_app_strings.dart';
import 'package:elements_app/product/constants/stringConstants/tr_app_strings.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/loadingBar/loading_bar.dart';
import 'package:elements_app/product/widget/container/what_is_container.dart';
import 'package:elements_app/product/widget/scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class InfoView extends StatefulWidget {
  final String apiType;
  final String title;
  const InfoView({
    super.key,
    required this.apiType,
    required this.title,
  });

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> with InfoViewMixin {
  @override
  Widget build(BuildContext context) {
    final admobProvider = Provider.of<AdmobProvider>(context);

    bool isTr = Provider.of<LocalizationProvider>(context).isTr;
    return AppScaffold(
      child: Scaffold(
        appBar: buildAppbar(),
        body: isLoading
            ? const LoadingBar()
            : Column(
                children: [
                  elementTypesContainer(context, isTr, admobProvider),
                  infoListBuilder(),
                ],
              ),
      ),
    );
  }

  FutureBuilder<List<Info>> infoListBuilder() {
    return FutureBuilder<List<Info>>(
      future: infoList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingBar();
        } else {
          final infos = snapshot.data;
          return ListView.builder(
            itemCount: infos!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final info = infos[index];
              return WhatIsContainer(info: info);
            },
          );
        }
      },
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      title: Text(widget.title),
    );
  }

  InkWell elementTypesContainer(
      BuildContext context, bool isTr, AdmobProvider admobProvider) {
    return InkWell(
      onTap: () {
        admobProvider.createAndShowInterstitialAd();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => ElementTypeView(
                apiType: ApiTypes.elementTypes,
                title: isTr
                    ? TrAppStrings.elementTypes
                    : EnAppStrings.elementTypes,
              ),
            ),
            (route) => false);
      },
      child: Padding(
        padding: context.paddingNormal,
        child: Container(
          height: context.dynamicHeight(0.075),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: AppColors.shPink,
                offset: Offset(4, 4),
                spreadRadius: 1,
              ),
            ],
            color: AppColors.pink,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: context.paddingLowHorizontal,
            child: Row(
              children: [
                SvgPicture.asset(
                  AssetConstants.instance.svgQuestionTwo,
                  height: context.dynamicHeight(0.05),
                ),
                SizedBox(
                  width: context.dynamicWidth(0.03),
                ),
                Text(
                  isTr ? TrAppStrings.elementTypes : EnAppStrings.elementTypes,
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: AppColors.background,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_right_alt_outlined,
                  size: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

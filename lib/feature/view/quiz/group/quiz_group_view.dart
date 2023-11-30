// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:elements_app/feature/mixin/quiz/group/quiz_group_mixin.dart';
import 'package:elements_app/feature/provider/admob_provider.dart';

import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/assets_constants.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/loadingBar/loading_bar.dart';
import 'package:elements_app/product/widget/container/element_group_container.dart';
import 'package:elements_app/product/widget/scaffold/app_scaffold.dart';
import 'package:elements_app/product/widget/sizedBox/vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class QuizGroupView extends StatefulWidget {
  final String apiType;
  final String title;
  const QuizGroupView({
    super.key,
    required this.title,
    required this.apiType,
  });

  @override
  _QuizGroupViewState createState() => _QuizGroupViewState();
}

class _QuizGroupViewState extends State<QuizGroupView> with QuizGroupMixin {
  @override
  Widget build(BuildContext context) {
    final admobProvider = Provider.of<AdmobProvider>(context);

    return AppScaffold(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: appBar(admobProvider),
        body: isLoading
            ? const LoadingBar()
            : Padding(
                padding: context.paddingNormal,
                child: Column(
                  children: [
                    Expanded(
                      child: wrongAndCorrectCounter(context),
                    ),
                    const VerticalSpacer(height: 0.05),
                    Expanded(
                      flex: 1,
                      child: symbolContainer(),
                    ),
                    const VerticalSpacer(height: 0.05),
                    Expanded(
                      flex: 8,
                      child: optionAnswerGrid(context),
                    ),
                  ],
                ),
              ),
        floatingActionButton: fabButton(retryCount),
      ),
    );
  }

  Widget fabButton(int retryCount) {
    return retryCount == 0
        ? const SizedBox.shrink()
        : FloatingActionButton(
            onPressed: askAndRetry,
            child: SvgPicture.asset(
              AssetConstants.instance.svgRefresh,
              color: AppColors.background,
            ),
          );
  }

  AppBar appBar(AdmobProvider admobProvider) {
    return AppBar(
      leading: IconButton(
          onPressed: () async {
            admobProvider.createAndShowInterstitialAd();
            Navigator.pop(context);

            await Future.delayed(const Duration(milliseconds: 700));
          },
          icon: const Icon(Icons.arrow_back)),
      title: const Text(
        "Grup Testi",
      ),
    );
  }

  GridView optionAnswerGrid(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: context.dynamicHeight(0.01),
      crossAxisSpacing: context.dynamicHeight(0.01),
      crossAxisCount: 2,
      padding: context.paddingLow,
      children: options.map((option) {
        return Padding(
          padding: context.paddingLow,
          child: ElementGroupContainer(
            color: AppColors.turquoise,
            shadowColor: AppColors.shTurquoise,
            onTap: () {
              checkAnswer(option);
            },
            title: option,
          ),
        );
      }).toList(),
    );
  }

  Container symbolContainer() {
    return Container(
      height: context.dynamicHeight(0.15),
      width: context.dynamicWidth(0.9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.purple,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                questionNumber,
                style: context.textTheme.headlineMedium?.copyWith(
                    color: AppColors.background, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row wrongAndCorrectCounter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        answerCounter(context, "$wrongCount", AppColors.darkBlue,
            Icons.favorite, AppColors.powderRed),
        answerCounter(context, "$correctCount", AppColors.darkBlue, Icons.check,
            AppColors.glowGreen),
        answerCounter(context, "$retryCount", AppColors.darkBlue,
            Icons.restart_alt, AppColors.purple),
      ],
    );
  }

  Row answerCounter(BuildContext context, String text, Color color,
      IconData icon, Color icColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: context.dynamicHeight(0.05),
          width: context.dynamicWidth(0.2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                color: icColor,
              ),
              Text(
                text,
                style: context.textTheme.headlineSmall?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: context.dynamicWidth(0.01),
        ),
      ],
    );
  }
}

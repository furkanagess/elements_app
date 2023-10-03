// ignore_for_file: library_private_types_in_public_api

import 'package:elements_app/feature/view/quiz/mixin/quiz_mixin.dart';
import 'package:elements_app/product/constants/themeConstants/app_colors.dart';
import 'package:elements_app/product/constants/assetConstants/svg_constants.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/container/element_group_container.dart';
import 'package:elements_app/product/widget/container/element_symbol_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class QuizView extends StatefulWidget {
  final String apiType;
  final String title;
  const QuizView({
    super.key,
    required this.title,
    required this.apiType,
  });

  @override
  _QuizViewState createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> with QuizMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: appBar(),
      body: isLoading
          ? loadingIndicator(context)
          : Padding(
              padding: context.paddingNormal,
              child: Column(
                children: [
                  Expanded(
                    child: wrongAndCorrectCounter(context),
                  ),
                  spacer(context, 0.05),
                  Expanded(
                    flex: 2,
                    child: symbolContainer(),
                  ),
                  spacer(context, 0.05),
                  Expanded(
                    flex: 8,
                    child: optionAnswerGrid(context),
                  ),
                ],
              ),
            ),
      floatingActionButton: fabButton(),
    );
  }

  Center loadingIndicator(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/lottie/loading.json',
        fit: BoxFit.cover,
        reverse: true,
        repeat: true,
        height: context.dynamicHeight(0.1),
      ),
    );
  }

  FloatingActionButton fabButton() {
    return FloatingActionButton(
      onPressed: askQuestion,
      child: SvgPicture.asset(
        SVGConstants.instance.refresh,
        color: AppColors.background,
      ),
    );
  }

  SizedBox spacer(BuildContext context, double value) =>
      SizedBox(height: context.dynamicHeight(value));

  AppBar appBar() {
    return AppBar(
      title: Text(
        "${widget.title} Quizi",
      ),
    );
  }

  GridView optionAnswerGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: options.map((option) {
        return Padding(
          padding: context.paddingLow,
          // child: AnimatedButton(
          //   color: AppColors.pink,
          //   duration: 2,
          //   shadowDegree: ShadowDegree.light,
          //   width: context.dynamicWidth(0.4),
          //   height: context.dynamicHeight(0.18),
          //   shape: BoxShape.rectangle,
          //   onPressed: () {
          //     checkAnswer(option);
          //   },
          //   child: Center(
          //     child: Padding(
          //       padding: context.paddingLowHorizontal,
          //       child: Text(
          //         option,
          //         textAlign: TextAlign.center,
          //         style: context.textTheme.headlineSmall?.copyWith(
          //           fontWeight: FontWeight.bold,
          //           color: AppColors.background,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

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

  ElementSymbolContainer symbolContainer() {
    return ElementSymbolContainer(
      title: questionSymbol,
      color: AppColors.purple,
      shadowColor: AppColors.shPurple,
    );
  }

  Row wrongAndCorrectCounter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        answerCounter(
            context, "$correctCount", AppColors.glowGreen, Icons.check),
        answerCounter(context, "$wrongCount", AppColors.powderRed, Icons.close),
      ],
    );
  }

  Row answerCounter(
      BuildContext context, String text, Color color, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: context.dynamicHeight(0.05),
          width: context.dynamicWidth(0.1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: Icon(
            icon,
            color: AppColors.background,
          ),
        ),
        SizedBox(
          width: context.dynamicWidth(0.03),
        ),
        Text(
          text,
          style: context.textTheme.headlineSmall?.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

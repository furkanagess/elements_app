import 'package:elements_app/feature/view/elementsList/view/elements_list_view.dart';
import 'package:elements_app/feature/view/groups/element_group_view.dart';
import 'package:elements_app/feature/view/info/view/what_is_view.dart';
import 'package:elements_app/feature/view/quiz/view/quiz_view.dart';
import 'package:elements_app/product/constants/api_types.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/app_strings.dart';
import 'package:elements_app/product/constants/assets_constants.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/button/gradient_button.dart';
import 'package:elements_app/product/widget/container/home_container.dart';
import 'package:elements_app/product/widget/textField/long_feedback_textfield.dart';
import 'package:elements_app/product/widget/text/text_icon_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
        children: [
          spacer(context, 0.02),
          const Spacer(),
          elementGroupRowOne(context),
          spacer(context, 0.04),
          elementGroupRowTwo(context),
          divider(context),
          reportAndRateRow(context),
          spacer(context, 0.02),
        ],
      ),
    );
  }

  SizedBox spacer(BuildContext context, double value) =>
      SizedBox(height: context.dynamicHeight(value));

  Row elementGroupRowTwo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        whatIsContainer(context),
        quizContainer(context),
      ],
    );
  }

  HomeContainer quizContainer(BuildContext context) {
    return HomeContainer(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const QuizView(
              apiType: ApiTypes.allElements,
              title: AppStrings.allElements,
            ),
          ),
        );
      },
      shadowColor: AppColors.shPink,
      color: AppColors.pink,
      title: AppStrings.quiz,
      svg: AssetConstants.instance.svgGameThree,
    );
  }

  HomeContainer whatIsContainer(BuildContext context) {
    return HomeContainer(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WhatIsView(),
          ),
        );
      },
      shadowColor: AppColors.shYellow,
      color: AppColors.yellow,
      title: AppStrings.what,
      svg: AssetConstants.instance.svgQuestionTwo,
    );
  }

  Row elementGroupRowOne(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        elementsContainer(context),
        elementGroupsContainer(context),
      ],
    );
  }

  HomeContainer elementsContainer(BuildContext context) {
    return HomeContainer(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ElementsListView(
              apiType: ApiTypes.allElements,
              title: AppStrings.allElements,
            ),
          ),
        );
      },
      shadowColor: AppColors.shTurquoise,
      color: AppColors.turquoise,
      title: AppStrings.appName,
      svg: AssetConstants.instance.svgElement,
    );
  }

  HomeContainer elementGroupsContainer(BuildContext context) {
    return HomeContainer(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ElementGroupView(),
          ),
        );
      },
      shadowColor: AppColors.shGlowGreen,
      color: AppColors.glowGreen,
      title: AppStrings.groups,
      svg: AssetConstants.instance.svgElementGroup,
    );
  }

  Divider divider(BuildContext context) {
    return Divider(
      thickness: 1,
      indent: 10,
      endIndent: 10,
      height: context.dynamicHeight(0.075),
      color: AppColors.powderRed,
    );
  }

  Row reportAndRateRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        infoButton(context),
        rateButton(context),
        reportButton(context),
      ],
    );
  }

  IconButton reportButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        reportBottomSheet(context);
      },
      icon: SvgPicture.asset(
        AssetConstants.instance.svgWarning,
        color: AppColors.pink,
        height: context.dynamicHeight(0.04),
      ),
    );
  }

  IconButton rateButton(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        AssetConstants.instance.svgStarTwo,
        color: AppColors.turquoise,
        height: context.dynamicHeight(0.04),
      ),
    );
  }

  IconButton infoButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        helpPopUp(context);
      },
      icon: SvgPicture.asset(
        AssetConstants.instance.svgQuestionThree,
        color: AppColors.yellow,
        height: context.dynamicHeight(0.04),
      ),
    );
  }

  Future<dynamic> reportBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      backgroundColor: AppColors.powderRed,
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Column(
            children: [
              SizedBox(height: context.dynamicHeight(0.05)),
              const FeedbackLongTextField(
                title: AppStrings.feedback,
              ),
              SizedBox(height: context.dynamicHeight(0.01)),
              GradientButton(
                title: AppStrings.sendFeedback,
                onTap: () => Navigator.pop(context),
              ),
              SizedBox(height: context.dynamicHeight(0.1)),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> helpPopUp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 3,
        backgroundColor: AppColors.darkBlue,
        title: Column(
          children: [
            SizedBox(height: context.dynamicHeight(0.05)),
            const TextIconRow(
              title: AppStrings.appName,
              color: AppColors.purple,
              icon: Icons.science,
            ),
            SizedBox(height: context.dynamicHeight(0.01)),
            const TextIconRow(
              title: AppStrings.appName,
              color: AppColors.pink,
              icon: Icons.science,
            ),
            SizedBox(height: context.dynamicHeight(0.01)),
            const TextIconRow(
              title: AppStrings.appName,
              color: AppColors.glowGreen,
              icon: Icons.science,
            ),
            SizedBox(height: context.dynamicHeight(0.01)),
            const TextIconRow(
              title: AppStrings.appName,
              color: AppColors.yellow,
              icon: Icons.science,
            ),
            SizedBox(height: context.dynamicHeight(0.03)),
            GradientButton(
              title: AppStrings.appName,
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  Text headerGroupText(BuildContext context) {
    return Text(
      AppStrings.appName,
      style: context.textTheme.labelLarge?.copyWith(
        color: AppColors.white,
      ),
    );
  }

  Text headerElementText(BuildContext context) {
    return Text(
      AppStrings.allElements,
      style: context.textTheme.labelLarge?.copyWith(
        color: AppColors.white,
      ),
    );
  }
}

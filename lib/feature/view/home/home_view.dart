import 'package:elements_app/feature/view/elements/all_elements_page.dart';
import 'package:elements_app/feature/view/quiz/quiz_page.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/app_strings.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/button/gradient_button.dart';
import 'package:elements_app/product/widget/container/element_group_container.dart';
import 'package:elements_app/product/widget/long_feedback_textfield.dart';
import 'package:elements_app/product/widget/text/text_icon_row.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: buildAppbar(context),
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            headerElementText(context),
            SizedBox(height: context.dynamicHeight(0.02)),
            headerGroupText(context),
            SizedBox(height: context.dynamicHeight(0.02)),
            elementGroupRowOne(context),
            SizedBox(height: context.dynamicHeight(0.04)),
            elementGroupRowTwo(context),
            divider(context),
            langAndHelpRow(context),
          ],
        ),
      ),
    );
  }

  Row elementGroupRowTwo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElementGroupContainer(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const NonMetalPageView(),
            //   ),
            // );
          },
          shadowColor: AppColors.shYellow,
          color: AppColors.yellow,
          title: "Nedir ?",
        ),
        ElementGroupContainer(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const QuizPage(),
              ),
            );
          },
          shadowColor: AppColors.shPink,
          color: AppColors.pink,
          title: "Quiz",
        ),
      ],
    );
  }

  Row elementGroupRowOne(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElementGroupContainer(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AllElementsPage(),
              ),
            );
          },
          shadowColor: AppColors.shTurquoise,
          color: AppColors.turquoise,
          title: "Elementler",
        ),
        ElementGroupContainer(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const MetalPageView(),
            //   ),
            // );
          },
          shadowColor: AppColors.shGlowGreen,
          color: AppColors.glowGreen,
          title: "Gruplar",
        ),
      ],
    );
  }

  Divider divider(BuildContext context) {
    return Divider(
      thickness: 2,
      indent: 10,
      endIndent: 10,
      height: context.dynamicHeight(0.075),
      color: AppColors.white,
    );
  }

  Row langAndHelpRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            helpPopUp(context);
          },
          icon: const Icon(
            Icons.help,
            color: AppColors.white,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {
            buildBottomSheet(context);
          },
          icon: const Icon(
            Icons.report,
            color: AppColors.white,
            size: 30,
          ),
        ),
        // IconButton(
        //   onPressed: () =>
        //       NotificationApi.showNotification(
        //title: "saddas",
        //body: "ewef ",
        //),
        //   icon: Icon(
        //     Icons.star_border,
        //     color: AppColors.white,
        //     size: 30,
        //   ),
        // ),
      ],
    );
  }

  Future<dynamic> buildBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      backgroundColor: AppColors.glowGreen,
      context: context,
      builder: (context) => Column(
        children: [
          SizedBox(height: context.dynamicHeight(0.05)),
          const FeedbackLongTextField(
            title: 'Please give us a feedback for develop the App',
          ),
          SizedBox(height: context.dynamicHeight(0.05)),
          GradientButton(
            title: 'Send your feedback',
            onTap: () => Navigator.pop(context),
          ),
        ],
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
            // SizedBox(
            //   width: context.dynamicWidth(0.7),
            //   height: context.dynamicHeight(0.2),
            //   child: Image.asset('assets/img/logo.png'),
            // ),
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

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.background,
    );
  }
}

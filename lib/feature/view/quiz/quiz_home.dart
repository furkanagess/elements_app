import 'package:elements_app/feature/provider/admob_provider.dart';
import 'package:elements_app/feature/provider/localization_provider.dart';
import 'package:elements_app/feature/view/home/home_view.dart';
import 'package:elements_app/feature/view/quiz/group/quiz_group_view.dart';
import 'package:elements_app/feature/view/quiz/number/quiz_number_view.dart';
import 'package:elements_app/feature/view/quiz/symbol/quiz_symbol_view.dart';
import 'package:elements_app/product/constants/api_types.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/assets_constants.dart';
import 'package:elements_app/product/constants/stringConstants/en_app_strings.dart';
import 'package:elements_app/product/constants/stringConstants/tr_app_strings.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/container/home_container.dart';
import 'package:elements_app/product/widget/scaffold/app_scaffold.dart';
import 'package:elements_app/product/widget/sizedBox/vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class QuizHomeView extends StatelessWidget {
  const QuizHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final admobProvider = Provider.of<AdmobProvider>(context);
    final bool isTr = Provider.of<LocalizationProvider>(context).isTr;

    return AppScaffold(
      child: Scaffold(
        appBar: quizHomeAppbar(admobProvider, context, isTr),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: symbolQuizColumn(),
              ),
              Expanded(
                child: groupQuizColumn(context),
              ),
              Expanded(
                child: numberQuizColumn(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column symbolQuizColumn() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        VerticalSpacer(height: 0.01),
        SymbolQuiz(),
        VerticalSpacer(height: 0.03),
        EasyLevelRow(),
      ],
    );
  }

  Column groupQuizColumn(BuildContext context) {
    return Column(
      children: [
        horizontalDivider(context),
        const VerticalSpacer(height: 0.01),
        const GroupQuiz(),
        const VerticalSpacer(height: 0.03),
        const MediumLevelRow(),
      ],
    );
  }

  Column numberQuizColumn(BuildContext context) {
    return Column(
      children: [
        horizontalDivider(context),
        const VerticalSpacer(height: 0.01),
        const NumberQuiz(),
        const VerticalSpacer(height: 0.03),
        const HardLevelRow(),
      ],
    );
  }

  Divider horizontalDivider(BuildContext context) {
    return Divider(
      thickness: 1,
      indent: 10,
      endIndent: 10,
      height: context.dynamicHeight(0.01),
      color: AppColors.purple,
    );
  }

  AppBar quizHomeAppbar(
      AdmobProvider admobProvider, BuildContext context, bool isTr) {
    return AppBar(
      leading: IconButton(
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              ));
        },
        icon: const Icon(
          Icons.arrow_back,
        ),
      ),
      title: Text(isTr ? TrAppStrings.quizes : EnAppStrings.quizes),
    );
  }
}

class HardLevelRow extends StatelessWidget {
  const HardLevelRow({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final bool isTr = Provider.of<LocalizationProvider>(context).isTr;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const QuizLevelIndicator(color: AppColors.powderRed, percent: 0.85),
        Text(
          isTr ? TrAppStrings.hard : EnAppStrings.hard,
          style: context.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class MediumLevelRow extends StatelessWidget {
  const MediumLevelRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isTr = Provider.of<LocalizationProvider>(context).isTr;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const QuizLevelIndicator(
          color: AppColors.yellow,
          percent: 0.6,
        ),
        Text(
          isTr ? TrAppStrings.medium : EnAppStrings.medium,
          style: context.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class EasyLevelRow extends StatelessWidget {
  const EasyLevelRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isTr = Provider.of<LocalizationProvider>(context).isTr;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const QuizLevelIndicator(color: AppColors.glowGreen, percent: 0.3),
        Text(
          isTr ? TrAppStrings.easy : EnAppStrings.easy,
          style: context.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class QuizLevelIndicator extends StatelessWidget {
  const QuizLevelIndicator({
    super.key,
    required this.color,
    required this.percent,
  });
  final Color color;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      width: 140.0,
      barRadius: const Radius.circular(20),
      lineHeight: 10.0,
      percent: percent,
      backgroundColor: AppColors.darkBlue,
      progressColor: color,
    );
  }
}

class GroupQuiz extends StatelessWidget {
  const GroupQuiz({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isTr = Provider.of<LocalizationProvider>(context).isTr;

    return HomeContainer(
      color: AppColors.pink,
      shadowColor: AppColors.shPink,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const QuizGroupView(
                apiType: ApiTypes.allElements, title: TrAppStrings.allElements),
          ),
        );
      },
      svg: AssetConstants.instance.svgGameThree,
      title: isTr ? TrAppStrings.groupQuiz : EnAppStrings.groupQuiz,
    );
  }
}

class NumberQuiz extends StatelessWidget {
  const NumberQuiz({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isTr = Provider.of<LocalizationProvider>(context).isTr;

    return HomeContainer(
      color: AppColors.purple,
      shadowColor: AppColors.shPurple,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const QuizNumberView(
                apiType: ApiTypes.allElements, title: TrAppStrings.allElements),
          ),
        );
      },
      svg: AssetConstants.instance.svgGameThree,
      title: isTr ? TrAppStrings.numberQuiz : EnAppStrings.numberQuiz,
    );
  }
}

class SymbolQuiz extends StatelessWidget {
  const SymbolQuiz({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isTr = Provider.of<LocalizationProvider>(context).isTr;

    return HomeContainer(
      color: AppColors.turquoise,
      shadowColor: AppColors.shTurquoise,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const QuizSymbolView(
                apiType: ApiTypes.allElements, title: TrAppStrings.allElements),
          ),
        );
      },
      svg: AssetConstants.instance.svgGameThree,
      title: isTr ? TrAppStrings.symbolQuiz : EnAppStrings.symbolQuiz,
    );
  }
}

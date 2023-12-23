import 'package:elements_app/feature/provider/localization_provider.dart';
import 'package:elements_app/feature/view/groups/element_group_view.dart';
import 'package:elements_app/feature/view/info/info_view.dart';
import 'package:elements_app/feature/view/quiz/quiz_home.dart';
import 'package:elements_app/feature/view/search/search_view.dart';
import 'package:elements_app/product/constants/api_types.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/stringConstants/en_app_strings.dart';
import 'package:elements_app/product/constants/assets_constants.dart';
import 'package:elements_app/product/constants/stringConstants/tr_app_strings.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/button/gradient_button.dart';
import 'package:elements_app/product/widget/container/home_container.dart';
import 'package:elements_app/product/widget/scaffold/app_scaffold.dart';
import 'package:elements_app/product/widget/text/text_icon_row.dart';
import 'package:elements_app/product/widget/textField/long_feedback_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:launch_review/launch_review.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:provider/provider.dart';

final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: context.paddingLowHorizontal,
          child: Column(
            children: [
              spacerVertical(context, 0.05),
              Expanded(
                child: appWelcome(context),
              ),
              spacerVertical(context, 0.03),
              Expanded(
                flex: 3,
                child: homeImage(context),
              ),
              spacerVertical(context, 0.05),
              Expanded(
                flex: 7,
                child: elementGroupColumn(context),
              ),
              Expanded(
                flex: 2,
                child: settingsRow(context),
              ),
              spacerVertical(context, 0.02),
            ],
          ),
        ),
      ),
    );
  }

  Column elementGroupColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        elementGroupRowOne(context),
        spacerVertical(context, 0.03),
        elementGroupRowTwo(context),
      ],
    );
  }

  Image homeImage(BuildContext context) {
    return Image.asset(
      AssetConstants.instance.pngHomeImage,
      height: context.dynamicHeight(0.2),
    );
  }

  Padding appWelcome(BuildContext context) {
    return Padding(
      padding: context.paddingLowHorizontal,
      child: Container(
        height: context.dynamicHeight(0.075),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: AppColors.shPurple,
              offset: Offset(2, 2),
              spreadRadius: 1,
            ),
          ],
          border: Border.all(
            color: AppColors.purple,
          ),
          color: AppColors.background,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: NeonText(
            text: context.read<LocalizationProvider>().isTr
                ? TrAppStrings.appName
                : EnAppStrings.appName,
            fontWeight: FontWeight.bold,
            isSoftWrap: true,
            spreadColor: Colors.purple,
            blurRadius: 100,
          ),
        ),
      ),
    );
  }

  SizedBox spacerVertical(BuildContext context, double value) =>
      SizedBox(height: context.dynamicHeight(value));

  SizedBox spacerHorizontal(BuildContext context, double value) =>
      SizedBox(height: context.dynamicWidth(value));

  Row elementGroupRowTwo(
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        whatIsContainer(context),
        quizContainer(context),
      ],
    );
  }

  HomeContainer quizContainer(
    BuildContext context,
  ) {
    return HomeContainer(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const QuizHomeView(),
          ),
        );
      },
      shadowColor: AppColors.shPink,
      color: AppColors.pink,
      title: context.read<LocalizationProvider>().isTr
          ? TrAppStrings.quiz
          : EnAppStrings.quiz,
      svg: AssetConstants.instance.svgGameThree,
    );
  }

  HomeContainer whatIsContainer(BuildContext context) {
    return HomeContainer(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InfoView(
              apiType: ApiTypes.whatIs,
              title: context.read<LocalizationProvider>().isTr
                  ? TrAppStrings.what
                  : EnAppStrings.what,
            ),
          ),
        );
      },
      shadowColor: AppColors.shYellow,
      color: AppColors.yellow,
      title: context.read<LocalizationProvider>().isTr
          ? TrAppStrings.what
          : EnAppStrings.what,
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
            builder: (context) => const SearchView(),
          ),
        );
      },
      shadowColor: AppColors.shTurquoise,
      color: AppColors.turquoise,
      title: context.read<LocalizationProvider>().isTr
          ? TrAppStrings.allElements
          : EnAppStrings.elements,
      svg: AssetConstants.instance.svgScienceTwo,
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
      title: context.read<LocalizationProvider>().isTr
          ? TrAppStrings.groups
          : EnAppStrings.groups,
      svg: AssetConstants.instance.svgElementGroup,
    );
  }

  Divider divider(BuildContext context) {
    return Divider(
      thickness: 1,
      indent: 10,
      endIndent: 10,
      height: context.dynamicHeight(0.05),
      color: AppColors.purple,
    );
  }

  Widget settingsRow(BuildContext context) {
    return Column(
      children: [
        divider(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            localizationFlags(context),
            rateButton(context),
            helpPopupButton(context),
          ],
        ),
      ],
    );
  }

  IconButton rateButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        rateBottomSheet(context);
      },
      icon: SvgPicture.asset(
        AssetConstants.instance.svgStarTwo,
        colorFilter: const ColorFilter.mode(
          AppColors.yellow,
          BlendMode.srcIn,
        ),
        height: context.dynamicHeight(0.04),
      ),
    );
  }

  IconButton helpPopupButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        helpPopUp(context);
      },
      icon: SvgPicture.asset(
        AssetConstants.instance.svgQuestion,
        colorFilter: const ColorFilter.mode(
          AppColors.glowGreen,
          BlendMode.srcIn,
        ),
        height: context.dynamicHeight(0.04),
      ),
    );
  }

  Future<dynamic> rateBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      isDismissible: false,
      builder: (context) => Padding(
        padding: context.paddingLowVertical,
        child: Container(
          width: context.width,
          height: context.dynamicHeight(0.5),
          decoration: const BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.white,
                  ),
                ),
              ),
              Image.asset(
                AssetConstants.instance.pngStarLogo,
                width: context.width,
                height: context.dynamicHeight(0.2),
              ),
              Padding(
                padding: context.paddingNormal,
                child: Text(
                  context.read<LocalizationProvider>().isTr
                      ? TrAppStrings.rateDescription
                      : EnAppStrings.rateDescription,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: AppColors.white,
                  ),
                  maxLines: 4,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: context.dynamicHeight(0.03),
              ),
              GradientButton(
                onTap: () {
                  Navigator.pop(context);
                  LaunchReview.launch(
                    // FIX ME
                    androidAppId: "com.furkanages.elements",
                  );
                },
                title: context.read<LocalizationProvider>().isTr
                    ? TrAppStrings.rateTitle
                    : EnAppStrings.rateTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget localizationFlags(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<LocalizationProvider>(context, listen: false).toggleBool();
      },
      child: context.watch<LocalizationProvider>().isTr
          ? SvgPicture.asset(
              AssetConstants.instance.svgUsFlag,
              height: context.dynamicHeight(0.05),
            )
          : SvgPicture.asset(
              AssetConstants.instance.svgTrFlag,
              height: context.dynamicHeight(0.05),
            ),
    );
  }

  Future<dynamic> helpPopUp(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        elevation: 3,
        backgroundColor: AppColors.background,
        title: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.white,
                  )),
            ),
            Image.asset(
              AssetConstants.instance.pnginfoLogo,
              width: context.width,
              height: context.dynamicHeight(0.1),
            ),
            spacerVertical(context, 0.01),
            TextIconRow(
              title: context.read<LocalizationProvider>().isTr
                  ? TrAppStrings.help1
                  : EnAppStrings.help1,
              color: AppColors.purple,
            ),
            spacerVertical(context, 0.01),
            TextIconRow(
              title: context.read<LocalizationProvider>().isTr
                  ? TrAppStrings.help2
                  : EnAppStrings.help2,
              color: AppColors.yellow,
            ),
            spacerVertical(context, 0.01),
            TextIconRow(
              title: context.read<LocalizationProvider>().isTr
                  ? TrAppStrings.help3
                  : EnAppStrings.help3,
              color: AppColors.glowGreen,
            ),
            spacerVertical(context, 0.01),
            TextIconRow(
              title: context.read<LocalizationProvider>().isTr
                  ? TrAppStrings.help4
                  : EnAppStrings.help4,
              color: AppColors.powderRed,
            ),
            spacerVertical(context, 0.01),
            TextIconRow(
              title: context.read<LocalizationProvider>().isTr
                  ? TrAppStrings.help5
                  : EnAppStrings.help5,
              color: AppColors.turquoise,
            ),
          ],
        ),
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
              spacerVertical(context, 0.05),
              const FeedbackLongTextField(
                title: EnAppStrings.feedback,
              ),
              spacerVertical(context, 0.01),
              GradientButton(
                title: EnAppStrings.sendFeedback,
                onTap: () => Navigator.pop(context),
              ),
              spacerVertical(context, 0.01),
            ],
          ),
        ),
      ),
    );
  }

  Text headerGroupText(BuildContext context) {
    return Text(
      EnAppStrings.appName,
      style: context.textTheme.labelLarge?.copyWith(
        color: AppColors.white,
      ),
    );
  }

  Text headerElementText(BuildContext context) {
    return Text(
      context.read<LocalizationProvider>().isTr
          ? TrAppStrings.allElements
          : EnAppStrings.allElements,
      style: context.textTheme.labelLarge?.copyWith(
        color: AppColors.white,
      ),
    );
  }
}

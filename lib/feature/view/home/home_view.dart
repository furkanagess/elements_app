import 'package:elements_app/feature/mixin/admob/ad_mob_mixin.dart';
import 'package:elements_app/feature/provider/localization_provider.dart';
import 'package:elements_app/feature/view/elementsList/elements_list_view.dart';
import 'package:elements_app/feature/view/groups/element_group_view.dart';
import 'package:elements_app/feature/view/info/info_view.dart';
import 'package:elements_app/feature/view/quiz/quiz_view.dart';
import 'package:elements_app/product/constants/api_types.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/stringConstants/en_app_strings.dart';
import 'package:elements_app/product/constants/assets_constants.dart';
import 'package:elements_app/product/constants/stringConstants/tr_app_strings.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/button/gradient_button.dart';
import 'package:elements_app/product/widget/container/home_container.dart';
import 'package:elements_app/product/widget/scaffold/app_scaffold.dart';
import 'package:elements_app/product/widget/textField/long_feedback_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:launch_review/launch_review.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<StatefulWidget> with AdMobMixin {
  @override
  Widget build(BuildContext context) {
    bool isTr = Provider.of<LocalizationProvider>(context).isTr;
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
                child: elementGroupColumn(context, isTr),
              ),
              Expanded(
                flex: 2,
                child: settingsRow(context, isTr),
              ),
              spacerVertical(context, 0.02),
            ],
          ),
        ),
      ),
    );
  }

  Column elementGroupColumn(BuildContext context, bool isTr) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        elementGroupRowOne(context, isTr),
        spacerVertical(context, 0.03),
        elementGroupRowTwo(context, isTr),
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
        child: const Center(
          child: NeonText(
            text: EnAppStrings.appName,
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

  Row elementGroupRowTwo(BuildContext context, bool isTr) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        whatIsContainer(context, isTr),
        quizContainer(context, isTr),
      ],
    );
  }

  HomeContainer quizContainer(
    BuildContext context,
    bool isTr,
  ) {
    return HomeContainer(
      onTap: () {
        showInterstitialAd();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizView(
              apiType: ApiTypes.allElements,
              title: isTr ? TrAppStrings.allElements : EnAppStrings.allElements,
            ),
          ),
        );
      },
      shadowColor: AppColors.shPink,
      color: AppColors.pink,
      title: isTr ? TrAppStrings.quiz : EnAppStrings.quiz,
      svg: AssetConstants.instance.svgGameThree,
    );
  }

  HomeContainer whatIsContainer(BuildContext context, bool isTr) {
    return HomeContainer(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InfoView(
              apiType: ApiTypes.whatIs,
              title: isTr ? TrAppStrings.what : EnAppStrings.what,
            ),
          ),
        );
      },
      shadowColor: AppColors.shYellow,
      color: AppColors.yellow,
      title: isTr ? TrAppStrings.what : EnAppStrings.what,
      svg: AssetConstants.instance.svgQuestionTwo,
    );
  }

  Row elementGroupRowOne(BuildContext context, bool isTr) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        elementsContainer(context, isTr),
        elementGroupsContainer(context, isTr),
      ],
    );
  }

  HomeContainer elementsContainer(BuildContext context, bool isTr) {
    return HomeContainer(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ElementsListView(
              apiType: ApiTypes.allElements,
              title: isTr ? TrAppStrings.allElements : EnAppStrings.allElements,
            ),
          ),
        );
      },
      shadowColor: AppColors.shTurquoise,
      color: AppColors.turquoise,
      title: isTr ? TrAppStrings.allElements : EnAppStrings.elements,
      svg: AssetConstants.instance.svgScienceTwo,
    );
  }

  HomeContainer elementGroupsContainer(BuildContext context, bool isTr) {
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
      title: isTr ? TrAppStrings.groups : EnAppStrings.groups,
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

  Widget settingsRow(BuildContext context, bool isTr) {
    return Column(
      children: [
        divider(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            localizationFlags(context, isTr),
            rateButton(context, isTr),
            reportButton(context),
          ],
        ),
      ],
    );
  }

  IconButton rateButton(BuildContext context, bool isTr) {
    return IconButton(
      onPressed: () {
        rateBottomSheet(context, isTr);
      },
      icon: SvgPicture.asset(
        AssetConstants.instance.svgStarTwo,
        colorFilter: const ColorFilter.mode(
          AppColors.turquoise,
          BlendMode.srcIn,
        ),
        height: context.dynamicHeight(0.04),
      ),
    );
  }

  IconButton reportButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        reportBottomSheet(context);
      },
      icon: SvgPicture.asset(
        AssetConstants.instance.svgWarning,
        colorFilter: const ColorFilter.mode(
          AppColors.pink,
          BlendMode.srcIn,
        ),
        height: context.dynamicHeight(0.04),
      ),
    );
  }

  Future<dynamic> rateBottomSheet(BuildContext context, bool isTr) {
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
          height: context.dynamicHeight(0.4),
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
                AssetConstants.instance.pngAppIcon,
                width: context.width,
                height: context.dynamicHeight(0.15),
              ),
              Padding(
                padding: context.paddingNormal,
                child: Text(
                  isTr
                      ? TrAppStrings.rateDescription
                      : EnAppStrings.rateDescription,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: AppColors.white,
                  ),
                  maxLines: 4,
                  textAlign: TextAlign.center,
                ),
              ),
              GradientButton(
                onTap: () {
                  Navigator.pop(context);
                  LaunchReview.launch(
                    // FIX ME
                    androidAppId: "com.rockstargames.gtasa",
                  );
                },
                title: isTr ? TrAppStrings.rateTitle : EnAppStrings.rateTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget localizationFlags(BuildContext context, bool isTr) {
    return GestureDetector(
      onTap: () {
        Provider.of<LocalizationProvider>(context, listen: false).toggleBool();
      },
      child: isTr
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
                title: EnAppStrings.feedback,
              ),
              SizedBox(height: context.dynamicHeight(0.01)),
              GradientButton(
                title: EnAppStrings.sendFeedback,
                onTap: () => Navigator.pop(context),
              ),
              SizedBox(height: context.dynamicHeight(0.1)),
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

  Text headerElementText(BuildContext context, bool isTr) {
    return Text(
      isTr ? TrAppStrings.allElements : EnAppStrings.allElements,
      style: context.textTheme.labelLarge?.copyWith(
        color: AppColors.white,
      ),
    );
  }
}

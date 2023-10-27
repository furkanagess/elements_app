import 'package:flutter/widgets.dart';

@immutable
final class AssetConstants {
  const AssetConstants._init();
  static AssetConstants? _instace;

  static AssetConstants get instance =>
      _instace ??= const AssetConstants._init();

  // SVG
  String toSVG(String src) => "assets/svg/$src.svg";
  String get svgElementGroup => toSVG("element_group"); // used
  String get svgGameThree => toSVG("game-3"); // used
  String get svgQuestionTwo => toSVG("question-2"); // used
  String get svgRefresh => toSVG("refresh"); // used
  String get svgStarTwo => toSVG("star-2"); // used
  String get svgWarning => toSVG("warning"); // used
  String get svgTube => toSVG("tube"); // used
  String get svgScienceTwo => toSVG("science_two"); // used
  String get svgTestTube => toSVG("test_tube"); // used
  String get svgGroup => toSVG("group"); // used
  String get svgPeriod => toSVG("period"); // used
  String get svgInfoTable => toSVG("info-table"); // used
  String get svgBlock => toSVG("block"); // used
  String get svgTrFlag => toSVG("turkey-flag"); // used
  String get svgUsFlag => toSVG("us-flag"); // used

  // Lottie
  String toLottie(String src) => "assets/lottie/$src.json";
  String get lottieCorrect => toLottie("correct"); // used
  String get lottieLoadingChemistry => toLottie("loading_chemistry"); // used
  String get lottieWrong => toLottie("wrong"); // used
  String get lottieConnection => toLottie("no-connection"); // used

  // PNG
  String toPNG(String src) => "assets/img/$src.png";
  String get pngHomeImage => toPNG("table-home-icon");
}

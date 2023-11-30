import 'package:flutter/material.dart';

/// The `AssetConstants` class provides a centralized location for defining asset paths in your Flutter application.
///
/// It includes methods for constructing asset paths for SVG, Lottie animations, and PNG images, making it easier
/// to manage and access assets used in your app.
@immutable
final class AssetConstants {
  const AssetConstants._init(); // Private constructor to prevent instantiation.
  static AssetConstants? _instace;

  /// Singleton instance getter for accessing the `AssetConstants`.
  static AssetConstants get instance =>
      _instace ??= const AssetConstants._init();

  // SVG
  String toSVG(String src) => "assets/svg/$src.svg";

  // SVG Asset Paths
  String get svgElementGroup => toSVG("element_group");
  String get svgGameThree => toSVG("game-3");
  String get svgQuestionTwo => toSVG("question-2");
  String get svgRefresh => toSVG("refresh");
  String get svgStarTwo => toSVG("star-2");
  String get svgWarning => toSVG("warning");
  String get svgTube => toSVG("tube");
  String get svgScienceTwo => toSVG("science_two");
  String get svgTestTube => toSVG("test_tube");
  String get svgGroup => toSVG("group");
  String get svgPeriod => toSVG("period");
  String get svgInfoTable => toSVG("info-table");
  String get svgBlock => toSVG("block");
  String get svgTrFlag => toSVG("turkey-flag");
  String get svgUsFlag => toSVG("us-flag");
  String get svgQuestion => toSVG("question-mark");
  String get svgEqual => toSVG("equal");
  // Lottie
  String toLottie(String src) => "assets/lottie/$src.json";

  // Lottie Animation Asset Paths
  String get lottieCorrect => toLottie("correct");
  String get lottieLoadingChemistry => toLottie("loading_chemistry");
  String get lottieWrong => toLottie("wrong");
  String get lottieConnection => toLottie("no-connection");
  String get lottieBrokenHeart => toLottie("broken-heart");
  String get lottieBroken => toLottie("broken");
  String get lottieNewHeart => toLottie("new-heart");
  // PNG
  String toPNG(String src) => "assets/img/$src.png";

  // PNG Image Asset Paths
  String get pngHomeImage => toPNG("table-home-icon");
  String get pngAppIcon => toPNG("remove-bg-logo");
  String get pngStarLogo => toPNG("rate-logo-ic");
  String get pnginfoLogo => toPNG("info-logo");
}

class AssetConstants {
  AssetConstants._init();
  static AssetConstants? _instace;

  static AssetConstants get instance => _instace ??= AssetConstants._init();

  // SVG
  String toSVG(String src) => "assets/svg/$src.svg";
  String get svgElementGroup => toSVG("element_group");
  String get svgElement => toSVG("element-svg");
  String get svgGameTwo => toSVG("game_2");
  String get svgGameThree => toSVG("game-3");
  String get svgGame => toSVG("game");
  String get svgQuestionTwo => toSVG("question-2");
  String get svgQuestion => toSVG("question");
  String get svgQuestionThree => toSVG("question-3");
  String get svgRefresh => toSVG("refresh");
  String get svgStar => toSVG("star");
  String get svgStarTwo => toSVG("star-2");
  String get svgWarning => toSVG("warning");
  String get svgRight => toSVG("right-icon");
  String get svgTube => toSVG("tube");
  String get svgScience => toSVG("science");
  String get svgScienceTwo => toSVG("science_two");
  String get svgTestTube => toSVG("test_tube");
  String get svgScientist => toSVG("scientist");
  String get svgAlienScientist => toSVG("alien_scientist");
  // Lottie
  String toLottie(String src) => "assets/lottie/$src.json";
  String get lottieCorrectTwo => toLottie("correct_2");
  String get lottieCorrect => toLottie("correct");
  String get lottieLoadingChem => toLottie("loading_chem");
  String get lottieLoadingChemistry => toLottie("loading_chemistry");
  String get lottieLoading => toLottie("loading");
  String get lottieWrong => toLottie("wrong");
}
